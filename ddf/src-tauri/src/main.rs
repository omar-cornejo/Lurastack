mod terminal_commands;
mod terraform_actions;

fn main() {
    tauri::Builder::default()
        .manage(terminal_commands::ReplState {
            buffer: std::sync::Mutex::new(String::new()),
            lines: std::sync::Mutex::new(Vec::new()),
        })
        .invoke_handler(tauri::generate_handler![terminal_commands::write_to_pty, terraform_actions::terraform_validate])
        .plugin(tauri_plugin_fs::init())
        .plugin(tauri_plugin_dialog::init())
        .run(tauri::generate_context!())
        .expect("error mientras se ejecutaba la aplicación Tauri");
}