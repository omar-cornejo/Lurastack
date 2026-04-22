mod terminal_commands;
mod terraform_actions;

fn main() {
    tauri::Builder::default()
        .manage(terminal_commands::TerminalState::default())
        .invoke_handler(tauri::generate_handler![
            terminal_commands::init_terminal_session,
            terminal_commands::write_to_pty,
            terminal_commands::close_terminal_session,
            terminal_commands::open_detached_terminal_window,
            terminal_commands::close_detached_terminal_window,
            terraform_actions::terraform_lsp_diagnostics,
            terraform_actions::terraform_validate,
            terraform_actions::terraform_plan,
            terraform_actions::terraform_apply,
            terraform_actions::terraform_destroy
        ])
        .plugin(tauri_plugin_fs::init())
        .plugin(tauri_plugin_dialog::init())
        .run(tauri::generate_context!())
        .expect("error mientras se ejecutaba la aplicación Tauri");
}