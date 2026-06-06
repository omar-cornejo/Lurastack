use std::{
    collections::HashMap,
    io::{Read, Write},
    sync::Mutex,
};

use percent_encoding::{utf8_percent_encode, AsciiSet, CONTROLS};
use portable_pty::{native_pty_system, CommandBuilder, PtySize};
use serde::{Deserialize, Serialize};
use tauri::{Emitter, Manager, WebviewUrl, WebviewWindowBuilder};

// Characters that must be escaped inside a URL query-string component.
// Based on the WHATWG URL "component percent-encode set" + a few extras
// that could otherwise break query parsing (`?` `=` `&` `+`).
const QUERY_COMPONENT_SET: &AsciiSet = &CONTROLS
    .add(b' ')
    .add(b'"')
    .add(b'#')
    .add(b'<')
    .add(b'>')
    .add(b'?')
    .add(b'`')
    .add(b'{')
    .add(b'}')
    .add(b'=')
    .add(b'&')
    .add(b'+')
    .add(b'%');

#[derive(Debug, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct TerminalEnv {
    #[serde(default)]
    pub vars: HashMap<String, String>,
}

struct TerminalSession {
    writer: Box<dyn Write + Send>,
    child: Box<dyn portable_pty::Child + Send>,
}

#[derive(Default)]
pub struct TerminalState {
    sessions: Mutex<HashMap<String, TerminalSession>>,
}

#[derive(Clone, Serialize)]
struct PtyOutputEvent {
    window_label: String,
    output: String,
}

fn shutdown_session_by_label(sessions: &mut HashMap<String, TerminalSession>, label: &str) {
    if let Some(mut active) = sessions.remove(label) {
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
    env: Option<TerminalEnv>,
) -> Result<(), String> {
    let window_label = window.label().to_string();
    let thread_window_label = window_label.clone();
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
    if let Some(terminal_env) = env.as_ref() {
        for (key, value) in &terminal_env.vars {
            if !key.trim().is_empty() {
                command.env(key, value);
            }
        }
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
                    let _ = window.emit(
                        "pty-output",
                        PtyOutputEvent {
                            window_label: thread_window_label.clone(),
                            output,
                        },
                    );
                }
                Err(_) => break,
            }
        }
    });

    let mut guard = state
        .sessions
        .lock()
        .map_err(|_| "No se pudo bloquear sesión de terminal".to_string())?;
    shutdown_session_by_label(&mut guard, &window_label);
    guard.insert(window_label, TerminalSession { writer, child });
    Ok(())
}

#[tauri::command]
pub fn write_to_pty(
    window: tauri::Window,
    state: tauri::State<TerminalState>,
    input: String,
) -> Result<(), String> {
    let window_label = window.label().to_string();
    let mut guard = state
        .sessions
        .lock()
        .map_err(|_| "No se pudo bloquear sesión de terminal".to_string())?;
    let Some(session) = guard.get_mut(&window_label) else {
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
pub fn close_terminal_session(
    window: tauri::Window,
    state: tauri::State<TerminalState>,
) -> Result<(), String> {
    let window_label = window.label().to_string();
    let mut guard = state
        .sessions
        .lock()
        .map_err(|_| "No se pudo bloquear sesión de terminal".to_string())?;
    shutdown_session_by_label(&mut guard, &window_label);
    Ok(())
}

#[tauri::command]
pub fn open_detached_terminal_window(
    app: tauri::AppHandle,
    cwd: String,
    view_id: Option<String>,
) -> Result<(), String> {
    let view_key = view_id
        .clone()
        .unwrap_or_else(|| "default".to_string())
        .replace(' ', "_");
    let label = format!("terminal-detached-{view_key}");

    if let Some(existing) = app.get_webview_window(&label) {
        let _ = existing.set_focus();
        return Ok(());
    }

    let encoded_cwd = utf8_percent_encode(&cwd, QUERY_COMPONENT_SET).to_string();
    let encoded_view_id =
        utf8_percent_encode(view_id.as_deref().unwrap_or(""), QUERY_COMPONENT_SET).to_string();
    let app_url = format!("/?detachedTerminal=1&cwd={encoded_cwd}&viewId={encoded_view_id}");

    let window = WebviewWindowBuilder::new(&app, label, WebviewUrl::App(app_url.into()))
        .title("LuraStack Terminal")
        .inner_size(980.0, 360.0)
        .resizable(true)
        .build()
        .map_err(|error| format!("No se pudo abrir ventana de terminal: {error}"))?;

    let _ = window.set_focus();
    Ok(())
}

#[tauri::command]
pub fn close_detached_terminal_window(
    app: tauri::AppHandle,
    state: tauri::State<TerminalState>,
    label: String,
) -> Result<(), String> {
    let mut guard = state
        .sessions
        .lock()
        .map_err(|_| "No se pudo bloquear sesión de terminal".to_string())?;
    shutdown_session_by_label(&mut guard, &label);
    drop(guard);

    let Some(window) = app.get_webview_window(&label) else {
        return Ok(());
    };

    let _ = window.destroy();
    Ok(())
}
