mod terminal_commands;
mod terraform_actions;

fn main() {
    tauri::Builder::default()
        .manage(terminal_commands::TerminalState::default())
        .invoke_handler(tauri::generate_handler![
            terminal_commands::init_terminal_session,
            terminal_commands::write_to_pty,
            terminal_commands::close_terminal_session,
            terraform_actions::terraform_validate
        ])
        .plugin(tauri_plugin_fs::init())
        .plugin(tauri_plugin_dialog::init())
        .run(tauri::generate_context!())
        .expect("error mientras se ejecutaba la aplicación Tauri");
}