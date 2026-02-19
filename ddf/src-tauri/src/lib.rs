use portable_pty::{native_pty_system, CommandBuilder, PtySize};
use std::io::{Read, Write};
use std::sync::{Arc, Mutex};
use tauri::{Emitter, Manager};

struct PtyState {
    writer: Arc<Mutex<Box<dyn Write + Send>>>,
}

#[tauri::command]
fn write_to_pty(state: tauri::State<PtyState>, input: String) {
    let mut writer = state.writer.lock().unwrap();
    writer.write_all(input.as_bytes()).unwrap();
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default().setup(|app| {
        let pty_system = native_pty_system();

        let pair = pty_system
            .openpty(PtySize {
                rows: 24,
                cols: 80,
                pixel_width: 0,
                pixel_height: 0,
            })
            .unwrap();

        let shell = if cfg!(windows) {
            CommandBuilder::new("powershell")
        } else {
            CommandBuilder::new("bash")
        };

        let mut _child = pair.slave.spawn_command(shell).unwrap();
        let mut reader = pair.master.try_clone_reader().unwrap();
        let writer = pair.master.take_writer().unwrap();

        let app_handle = app.handle().clone();

        std::thread::spawn(move || {
            let mut buffer = [0u8; 1024];
            loop {
                match reader.read(&mut buffer) {
                    Ok(n) if n > 0 => {
                        let output = String::from_utf8_lossy(&buffer[..n]).to_string();
                        let _ = app_handle.emit("pty-output", output);
                    }
                    _ => {}
                }
            }
        });

        app.manage(PtyState {
            writer: Arc::new(Mutex::new(writer)),
        });

        Ok(())
    })
    .plugin(tauri_plugin_opener::init())
    .invoke_handler(tauri::generate_handler![write_to_pty])
    .run(tauri::generate_context!())
    .expect("error while running tauri application");
}
