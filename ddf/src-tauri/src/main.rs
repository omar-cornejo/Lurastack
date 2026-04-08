use std::sync::Mutex;

use tauri::Emitter;

/// Estado de la REPL: vamos acumulando lo que el usuario escribe
/// hasta que pulse Enter (\r o \n).
struct ReplState {
    buffer: Mutex<String>,
    lines: Mutex<Vec<String>>,
}

const MAX_LINE: usize = 80;
const MAX_LINES: usize = 10;

/// Función de evaluación de la REPL.
/// Aquí es donde puedes implementar tu propio “lenguaje” o lógica.
fn eval_line(line: &str) -> String {
    match line.trim() {
        "" => "".to_string(),
        "clear" => {
            // Secuencia ANSI para limpiar pantalla y mover el cursor al inicio
            "\u{1b}[3J\u{1b}[2J\u{1b}[H".to_string()
        }
        "help" => "Comandos disponibles: help, ping".to_string(),
        "ping" => "pong".to_string(),
        _ => "".to_string(),

        error => format!("Comando no reconocido: '{}'", error),
    }
}

#[tauri::command]
fn write_to_pty(window: tauri::Window, state: tauri::State<ReplState>, input: String) {
    let mut buffer = state
    .buffer
    .lock()
    .expect("no se pudo bloquear el buffer de la REPL");

    let mut lines = state
        .lines
        .lock()
        .expect("no se pudo bloquear las líneas de la REPL");

    for ch in input.chars() {
        match ch {
            // Backspace / Delete
            '\u{8}' | '\u{7f}' => {
                if !buffer.is_empty() {
                    buffer.pop();
                    // Mover cursor una posición atrás, sobrescribir con espacio y volver atrás
                    let _ = window.emit("pty-output", "\u{8} \u{8}".to_string());
                }
            }
            // Enter: evaluamos la línea actual
            '\r' | '\n' => {
                let line = buffer.trim().to_string();

                if !line.is_empty() {
                    // guardamos la línea en historial
                    lines.push(line.clone());

                    // limitamos el historial
                    if lines.len() > MAX_LINES {
                        lines.remove(0);
                    }

                    // evaluamos la línea
                    let result = eval_line(&line);

                    if !result.is_empty() {
                        lines.push(result.clone());

                        if lines.len() > MAX_LINES {
                            lines.remove(0);
                        }
                    }

                    // reconstruimos pantalla
                    let mut screen = String::from("\x1B[2J\x1B[H");

                    for l in lines.iter() {
                        screen.push_str(l);
                        screen.push_str("\r\n");
                    }

                    let _ = window.emit("pty-output", screen);
                } else {
                    let _ = window.emit("pty-output", "\r\n".to_string());
                }

                buffer.clear();
            }
            // Cualquier otro carácter: lo añadimos al buffer y lo mostramos
            _ => {
                if buffer.len() >= MAX_LINE {
                    let _ = window.emit("pty-output", "\r\n".to_string());
                    buffer.clear();
                }

                buffer.push(ch);
                let _ = window.emit("pty-output", ch.to_string());
            }
        }
    }
}

fn main() {
    tauri::Builder::default()
        .manage(ReplState {
            buffer: Mutex::new(String::new()),
            lines: Mutex::new(Vec::new()),
        })
        .invoke_handler(tauri::generate_handler![write_to_pty])
        .plugin(tauri_plugin_fs::init())
        .plugin(tauri_plugin_dialog::init())
        .run(tauri::generate_context!())
        .expect("error mientras se ejecutaba la aplicación Tauri");
}