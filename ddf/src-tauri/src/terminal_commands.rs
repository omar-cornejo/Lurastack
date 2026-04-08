use std::sync::Mutex;

use tauri::Emitter;

pub struct ReplState {
    pub buffer: Mutex<String>,
    pub lines: Mutex<Vec<String>>,
}

const MAX_LINE: usize = 80;
const MAX_LINES: usize = 10;

fn eval_line(line: &str) -> String {
    match line.trim() {
        "" => "".to_string(),
        "clear" => "\u{1b}[3J\u{1b}[2J\u{1b}[H".to_string(),
        "help" => "Comandos disponibles: help, ping".to_string(),
        "ping" => "pong".to_string(),
        error => format!("Comando no reconocido: '{}'", error),
    }
}

#[tauri::command]
pub fn write_to_pty(window: tauri::Window, state: tauri::State<ReplState>, input: String) {
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
            '\u{8}' | '\u{7f}' => {
                if !buffer.is_empty() {
                    buffer.pop();
                    let _ = window.emit("pty-output", "\u{8} \u{8}".to_string());
                }
            }
            '\r' | '\n' => {
                let line = buffer.trim().to_string();

                if !line.is_empty() {
                    lines.push(line.clone());

                    if lines.len() > MAX_LINES {
                        lines.remove(0);
                    }

                    let result = eval_line(&line);

                    if !result.is_empty() {
                        lines.push(result.clone());

                        if lines.len() > MAX_LINES {
                            lines.remove(0);
                        }
                    }

                    let mut screen = String::from("\x1B[2J\x1B[H");

                    for saved_line in lines.iter() {
                        screen.push_str(saved_line);
                        screen.push_str("\r\n");
                    }

                    let _ = window.emit("pty-output", screen);
                } else {
                    let _ = window.emit("pty-output", "\r\n".to_string());
                }

                buffer.clear();
            }
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