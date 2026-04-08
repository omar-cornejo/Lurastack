use std::{
    io::{Read, Write},
    sync::Mutex,
};

use portable_pty::{native_pty_system, CommandBuilder, PtySize};
use tauri::Emitter;

struct TerminalSession {
    writer: Box<dyn Write + Send>,
    child: Box<dyn portable_pty::Child + Send>,
}

#[derive(Default)]
pub struct TerminalState {
    session: Mutex<Option<TerminalSession>>,
}

fn shutdown_session(session: &mut Option<TerminalSession>) {
    if let Some(mut active) = session.take() {
        let _ = active.writer.flush();
        let _ = active.child.kill();
        let _ = active.child.wait();
    }
}

#[tauri::command]
pub fn init_terminal_session(
    window: tauri::Window,
    state: tauri::State<TerminalState>,
    cwd: String,
) -> Result<(), String> {
    let pty_system = native_pty_system();
    let pair = pty_system
        .openpty(PtySize {
            rows: 40,
            cols: 120,
            pixel_width: 0,
            pixel_height: 0,
        })
        .map_err(|error| format!("No se pudo crear PTY: {error}"))?;

    let shell = std::env::var("SHELL").unwrap_or_else(|_| "/bin/bash".to_string());
    let mut command = CommandBuilder::new(&shell);
    if !cwd.trim().is_empty() {
        command.cwd(cwd.trim());
    }

    let child = pair
        .slave
        .spawn_command(command)
        .map_err(|error| format!("No se pudo iniciar shell: {error}"))?;

    let mut reader = pair
        .master
        .try_clone_reader()
        .map_err(|error| format!("No se pudo clonar reader de PTY: {error}"))?;
    let writer = pair
        .master
        .take_writer()
        .map_err(|error| format!("No se pudo obtener writer de PTY: {error}"))?;

    std::thread::spawn(move || {
        let mut buffer = [0u8; 8192];
        loop {
            match reader.read(&mut buffer) {
                Ok(0) => break,
                Ok(count) => {
                    let output = String::from_utf8_lossy(&buffer[..count]).to_string();
                    let _ = window.emit("pty-output", output);
                }
                Err(_) => break,
            }
        }
    });

    let mut guard = state
        .session
        .lock()
        .map_err(|_| "No se pudo bloquear sesión de terminal".to_string())?;
    shutdown_session(&mut guard);
    *guard = Some(TerminalSession { writer, child });
    Ok(())
}

#[tauri::command]
pub fn write_to_pty(state: tauri::State<TerminalState>, input: String) -> Result<(), String> {
    let mut guard = state
        .session
        .lock()
        .map_err(|_| "No se pudo bloquear sesión de terminal".to_string())?;
    let Some(session) = guard.as_mut() else {
        return Err("Terminal no inicializada".to_string());
    };

    session
        .writer
        .write_all(input.as_bytes())
        .map_err(|error| format!("No se pudo escribir en PTY: {error}"))?;
    session
        .writer
        .flush()
        .map_err(|error| format!("No se pudo flush PTY: {error}"))?;
    Ok(())
}

#[tauri::command]
pub fn close_terminal_session(state: tauri::State<TerminalState>) -> Result<(), String> {
    let mut guard = state
        .session
        .lock()
        .map_err(|_| "No se pudo bloquear sesión de terminal".to_string())?;
    shutdown_session(&mut guard);
    Ok(())
}