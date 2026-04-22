use std::{
    fs,
    io::{BufRead, BufReader, Read, Write},
    path::PathBuf,
    process::{ChildStdin, Command, Stdio},
    sync::{mpsc, Arc, Mutex},
    time::{Duration, Instant},
};

use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use tauri::Emitter;

pub struct TerraformInteractiveState {
    pub stdin: Arc<Mutex<Option<ChildStdin>>>,
}

impl Default for TerraformInteractiveState {
    fn default() -> Self {
        Self {
            stdin: Arc::new(Mutex::new(None)),
        }
    }
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct AwsCredentials {
    pub access_key_id: String,
    pub secret_access_key: String,
    pub session_token: Option<String>,
    pub region: String,
}

#[derive(Clone, Serialize)]
struct TerraformOutputEvent {
    window_label: String,
    output: String,
}

fn emit_output(window: &tauri::Window, output: &str) {
    let _ = window.emit(
        "terraform-output",
        TerraformOutputEvent {
            window_label: window.label().to_string(),
            output: output.to_string(),
        },
    );
}

fn terraform_init_for_deploy(
    window: &tauri::Window,
    project_dir_path: &PathBuf,
    aws_credentials: &AwsCredentials,
) -> Result<(), String> {
    emit_output(window, "\r\n\x1b[36m→ terraform init\x1b[0m\r\n");

    let mut command = Command::new("terraform");
    command
        .arg("init")
        .arg("-input=false")
        .arg("-no-color")
        .current_dir(project_dir_path)
        .env("AWS_ACCESS_KEY_ID", &aws_credentials.access_key_id)
        .env("AWS_SECRET_ACCESS_KEY", &aws_credentials.secret_access_key)
        .env("AWS_DEFAULT_REGION", &aws_credentials.region)
        .stdout(Stdio::piped())
        .stderr(Stdio::piped());

    if let Some(token) = aws_credentials.session_token.as_deref() {
        if !token.trim().is_empty() {
            command.env("AWS_SESSION_TOKEN", token);
        }
    }

    let mut child = command
        .spawn()
        .map_err(|error| format!("No se pudo iniciar terraform init: {error}"))?;

    let stdout = child.stdout.take().unwrap();
    let stderr = child.stderr.take().unwrap();

    let (tx_out, rx) = mpsc::channel::<String>();
    let tx_err = tx_out.clone();

    std::thread::spawn(move || {
        let reader = BufReader::new(stdout);
        for line in reader.lines().map_while(Result::ok) {
            let _ = tx_out.send(format!("{line}\r\n"));
        }
    });
    std::thread::spawn(move || {
        let reader = BufReader::new(stderr);
        for line in reader.lines().map_while(Result::ok) {
            let _ = tx_err.send(format!("\x1b[33m{line}\x1b[0m\r\n"));
        }
    });

    loop {
        match rx.recv_timeout(Duration::from_millis(50)) {
            Ok(line) => emit_output(window, &line),
            Err(mpsc::RecvTimeoutError::Timeout) => {
                if child.try_wait().map(|s| s.is_some()).unwrap_or(false) {
                    // drain remaining
                    while let Ok(line) = rx.try_recv() {
                        emit_output(window, &line);
                    }
                    break;
                }
            }
            Err(_) => break,
        }
    }

    let status = child.wait().map_err(|error| format!("Error esperando terraform init: {error}"))?;
    if !status.success() {
        emit_output(window, "\x1b[31m✗ terraform init falló\x1b[0m\r\n");
        return Err("terraform init falló".to_string());
    }
    emit_output(window, "\x1b[32m✓ terraform init completado\x1b[0m\r\n");
    Ok(())
}

fn run_terraform_streaming(
    window: &tauri::Window,
    args: &[&str],
    project_dir_path: &PathBuf,
    aws_credentials: &AwsCredentials,
) -> Result<bool, String> {
    let mut cmd = Command::new("terraform");
    for arg in args {
        cmd.arg(arg);
    }
    cmd.current_dir(project_dir_path)
        .env("AWS_ACCESS_KEY_ID", &aws_credentials.access_key_id)
        .env("AWS_SECRET_ACCESS_KEY", &aws_credentials.secret_access_key)
        .env("AWS_DEFAULT_REGION", &aws_credentials.region)
        .env("TF_IN_AUTOMATION", "1")
        .stdout(Stdio::piped())
        .stderr(Stdio::piped());

    if let Some(token) = aws_credentials.session_token.as_deref() {
        if !token.trim().is_empty() {
            cmd.env("AWS_SESSION_TOKEN", token);
        }
    }

    let mut child = cmd
        .spawn()
        .map_err(|error| format!("No se pudo iniciar terraform {}: {error}", args.first().unwrap_or(&"")))?;

    let stdout = child.stdout.take().unwrap();
    let stderr = child.stderr.take().unwrap();

    let (tx_out, rx) = mpsc::channel::<String>();
    let tx_err = tx_out.clone();

    std::thread::spawn(move || {
        let reader = BufReader::new(stdout);
        for line in reader.lines().map_while(Result::ok) {
            let _ = tx_out.send(format!("{line}\r\n"));
        }
    });
    std::thread::spawn(move || {
        let reader = BufReader::new(stderr);
        for line in reader.lines().map_while(Result::ok) {
            let _ = tx_err.send(format!("\x1b[33m{line}\x1b[0m\r\n"));
        }
    });

    loop {
        match rx.recv_timeout(Duration::from_millis(50)) {
            Ok(line) => emit_output(window, &line),
            Err(mpsc::RecvTimeoutError::Timeout) => {
                if child.try_wait().map(|s| s.is_some()).unwrap_or(false) {
                    while let Ok(line) = rx.try_recv() {
                        emit_output(window, &line);
                    }
                    break;
                }
            }
            Err(_) => break,
        }
    }

    let status = child.wait().map_err(|error| format!("Error esperando terraform: {error}"))?;
    Ok(status.success())
}

fn run_terraform_interactive_inner(
    window: &tauri::Window,
    args: &[&str],
    project_dir_path: &PathBuf,
    aws_credentials: &AwsCredentials,
    stdin_arc: &Arc<Mutex<Option<ChildStdin>>>,
) -> Result<bool, String> {
    let mut cmd = Command::new("terraform");
    for arg in args {
        cmd.arg(arg);
    }
    cmd.current_dir(project_dir_path)
        .env("AWS_ACCESS_KEY_ID", &aws_credentials.access_key_id)
        .env("AWS_SECRET_ACCESS_KEY", &aws_credentials.secret_access_key)
        .env("AWS_DEFAULT_REGION", &aws_credentials.region)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped());

    if let Some(token) = aws_credentials.session_token.as_deref() {
        if !token.trim().is_empty() {
            cmd.env("AWS_SESSION_TOKEN", token);
        }
    }

    let mut child = cmd
        .spawn()
        .map_err(|error| format!("No se pudo iniciar terraform {}: {error}", args.first().unwrap_or(&"")))?;

    let child_stdin = child
        .stdin
        .take()
        .ok_or_else(|| "No se pudo obtener stdin del proceso terraform".to_string())?;
    *stdin_arc.lock().unwrap() = Some(child_stdin);

    let stdout = child.stdout.take().unwrap();
    let stderr = child.stderr.take().unwrap();

    let (tx_out, rx) = mpsc::channel::<String>();
    let tx_err = tx_out.clone();

    std::thread::spawn(move || {
        let mut reader = stdout;
        let mut buf = [0u8; 1024];
        loop {
            match reader.read(&mut buf) {
                Ok(0) => break,
                Ok(n) => {
                    let text = String::from_utf8_lossy(&buf[..n]).into_owned();
                    let normalized = text.replace("\r\n", "\n").replace('\r', "\n").replace('\n', "\r\n");
                    let _ = tx_out.send(normalized);
                }
                Err(_) => break,
            }
        }
    });

    std::thread::spawn(move || {
        let mut reader = stderr;
        let mut buf = [0u8; 1024];
        loop {
            match reader.read(&mut buf) {
                Ok(0) => break,
                Ok(n) => {
                    let text = String::from_utf8_lossy(&buf[..n]).into_owned();
                    let normalized = text.replace("\r\n", "\n").replace('\r', "\n").replace('\n', "\r\n");
                    let colored = format!("\x1b[33m{normalized}\x1b[0m");
                    let _ = tx_err.send(colored);
                }
                Err(_) => break,
            }
        }
    });

    loop {
        match rx.recv_timeout(Duration::from_millis(50)) {
            Ok(chunk) => emit_output(window, &chunk),
            Err(mpsc::RecvTimeoutError::Timeout) => {
                if child.try_wait().map(|s| s.is_some()).unwrap_or(false) {
                    while let Ok(chunk) = rx.try_recv() {
                        emit_output(window, &chunk);
                    }
                    break;
                }
            }
            Err(_) => break,
        }
    }

    let status = child.wait().map_err(|error| format!("Error esperando terraform: {error}"))?;
    *stdin_arc.lock().unwrap() = None;
    Ok(status.success())
}

#[tauri::command]
pub fn terraform_confirm(
    input: String,
    state: tauri::State<'_, TerraformInteractiveState>,
) -> Result<(), String> {
    let mut guard = state
        .stdin
        .lock()
        .map_err(|error| format!("Error de lock: {error}"))?;
    if let Some(stdin) = guard.as_mut() {
        writeln!(stdin, "{}", input.trim())
            .map_err(|error| format!("Error enviando input a terraform: {error}"))?;
        stdin
            .flush()
            .map_err(|error| format!("Error en flush de stdin: {error}"))?;
        Ok(())
    } else {
        Err("No hay proceso terraform interactivo esperando input".to_string())
    }
}

#[tauri::command]
pub async fn terraform_plan(
    window: tauri::Window,
    project_dir: String,
    files: Vec<TerraformSourceFile>,
    aws_credentials: AwsCredentials,
) -> Result<bool, String> {
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            sync_project_tf_files(&project_dir_path, &files)?;
        }

        emit_output(&window, "\x1b[1m\x1b[35m╔══════════════════════════════╗\r\n║     terraform plan           ║\r\n╚══════════════════════════════╝\x1b[0m\r\n");

        terraform_init_for_deploy(&window, &project_dir_path, &aws_credentials)?;

        emit_output(&window, "\r\n\x1b[36m→ terraform plan\x1b[0m\r\n");
        let success = run_terraform_streaming(
            &window,
            &["plan", "-no-color", "-input=false"],
            &project_dir_path,
            &aws_credentials,
        )?;

        if success {
            emit_output(&window, "\r\n\x1b[32m✓ Plan completado exitosamente\x1b[0m\r\n");
        } else {
            emit_output(&window, "\r\n\x1b[31m✗ Plan terminó con errores\x1b[0m\r\n");
        }
        Ok(success)
    })
    .await
    .map_err(|error| format!("Error interno ejecutando plan: {error}"))?
}

#[tauri::command]
pub async fn terraform_plan_destroy(
    window: tauri::Window,
    project_dir: String,
    files: Vec<TerraformSourceFile>,
    aws_credentials: AwsCredentials,
) -> Result<bool, String> {
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            sync_project_tf_files(&project_dir_path, &files)?;
        }

        emit_output(&window, "\x1b[1m\x1b[35m╔══════════════════════════════╗\r\n║   terraform plan -destroy    ║\r\n╚══════════════════════════════╝\x1b[0m\r\n");

        terraform_init_for_deploy(&window, &project_dir_path, &aws_credentials)?;

        emit_output(&window, "\r\n\x1b[36m→ terraform plan -destroy\x1b[0m\r\n");
        let success = run_terraform_streaming(
            &window,
            &["plan", "-destroy", "-no-color", "-input=false"],
            &project_dir_path,
            &aws_credentials,
        )?;

        if success {
            emit_output(&window, "\r\n\x1b[32m✓ Plan destroy completado exitosamente\x1b[0m\r\n");
        } else {
            emit_output(&window, "\r\n\x1b[31m✗ Plan destroy terminó con errores\x1b[0m\r\n");
        }
        Ok(success)
    })
    .await
    .map_err(|error| format!("Error interno ejecutando plan destroy: {error}"))?
}

#[tauri::command]
pub async fn terraform_apply(
    window: tauri::Window,
    project_dir: String,
    files: Vec<TerraformSourceFile>,
    aws_credentials: AwsCredentials,
    state: tauri::State<'_, TerraformInteractiveState>,
) -> Result<bool, String> {
    let stdin_arc = state.stdin.clone();
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            sync_project_tf_files(&project_dir_path, &files)?;
        }

        emit_output(&window, "\x1b[1m\x1b[35m╔══════════════════════════════╗\r\n║     terraform apply          ║\r\n╚══════════════════════════════╝\x1b[0m\r\n");

        terraform_init_for_deploy(&window, &project_dir_path, &aws_credentials)?;

        emit_output(&window, "\r\n\x1b[36m→ terraform apply\x1b[0m\r\n");
        let success = run_terraform_interactive_inner(
            &window,
            &["apply", "-no-color"],
            &project_dir_path,
            &aws_credentials,
            &stdin_arc,
        )?;

        if success {
            emit_output(&window, "\r\n\x1b[32m✓ Apply completado. Recursos creados en AWS.\x1b[0m\r\n");
        } else {
            emit_output(&window, "\r\n\x1b[31m✗ Apply terminó con errores\x1b[0m\r\n");
        }
        Ok(success)
    })
    .await
    .map_err(|error| format!("Error interno ejecutando apply: {error}"))?
}

#[tauri::command]
pub async fn terraform_destroy(
    window: tauri::Window,
    project_dir: String,
    files: Vec<TerraformSourceFile>,
    aws_credentials: AwsCredentials,
    state: tauri::State<'_, TerraformInteractiveState>,
) -> Result<bool, String> {
    let stdin_arc = state.stdin.clone();
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            sync_project_tf_files(&project_dir_path, &files)?;
        }

        emit_output(&window, "\x1b[1m\x1b[35m╔══════════════════════════════╗\r\n║    terraform destroy         ║\r\n╚══════════════════════════════╝\x1b[0m\r\n");

        terraform_init_for_deploy(&window, &project_dir_path, &aws_credentials)?;

        emit_output(&window, "\r\n\x1b[36m→ terraform destroy\x1b[0m\r\n");
        let success = run_terraform_interactive_inner(
            &window,
            &["destroy", "-no-color"],
            &project_dir_path,
            &aws_credentials,
            &stdin_arc,
        )?;

        if success {
            emit_output(&window, "\r\n\x1b[32m✓ Destroy completado. Recursos eliminados de AWS.\x1b[0m\r\n");
        } else {
            emit_output(&window, "\r\n\x1b[31m✗ Destroy terminó con errores\x1b[0m\r\n");
        }
        Ok(success)
    })
    .await
    .map_err(|error| format!("Error interno ejecutando destroy: {error}"))?
}

#[derive(Debug, Deserialize)]
struct TerraformValidateJson {
    valid: Option<bool>,
    diagnostics: Option<Vec<TerraformValidateJsonDiagnostic>>,
}

#[derive(Debug, Deserialize)]
struct TerraformValidateJsonDiagnostic {
    severity: Option<String>,
    summary: Option<String>,
    detail: Option<String>,
    range: Option<TerraformValidateJsonRange>,
}

#[derive(Debug, Deserialize)]
struct TerraformValidateJsonRange {
    filename: Option<String>,
    start: Option<TerraformValidateJsonPosition>,
    end: Option<TerraformValidateJsonPosition>,
}

#[derive(Debug, Deserialize)]
struct TerraformValidateJsonPosition {
    line: Option<usize>,
    column: Option<usize>,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TerraformValidateDiagnostic {
    severity: String,
    summary: String,
    detail: String,
    filename: Option<String>,
    start_line: Option<usize>,
    start_column: Option<usize>,
    end_line: Option<usize>,
    end_column: Option<usize>,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TerraformValidateResult {
    ok: bool,
    diagnostics: Vec<TerraformValidateDiagnostic>,
    init_ran: bool,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TerraformLspDiagnosticsResult {
    diagnostics: Vec<TerraformValidateDiagnostic>,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct TerraformSourceFile {
    name: String,
    content: String,
}

fn sanitize_tf_file_name(raw_name: &str) -> Result<String, String> {
    let candidate = raw_name.trim();
    if candidate.is_empty() {
        return Err("Nombre de archivo vacío en validate.".to_string());
    }

    let as_path = PathBuf::from(candidate);
    let file_name = as_path
        .file_name()
        .and_then(|name| name.to_str())
        .ok_or_else(|| format!("Nombre de archivo inválido: {candidate}"))?
        .to_string();

    if !file_name.to_lowercase().ends_with(".tf") {
        return Err(format!("Solo se permiten archivos .tf en validate: {file_name}"));
    }

    Ok(file_name)
}

fn sync_project_tf_files(
    project_dir_path: &PathBuf,
    files: &[TerraformSourceFile],
) -> Result<Vec<TerraformSourceFile>, String> {
    if files.is_empty() {
        return Err("No hay archivos Terraform para validar.".to_string());
    }

    let mut normalized_files = Vec::<TerraformSourceFile>::new();
    let mut provided_tf_names = std::collections::HashSet::<String>::new();

    for file in files {
        let file_name = sanitize_tf_file_name(&file.name)?;
        provided_tf_names.insert(file_name.clone());

        let file_path = project_dir_path.join(&file_name);
        fs::write(&file_path, &file.content)
            .map_err(|error| format!("No se pudo escribir archivo temporal '{}': {error}", file_name))?;

        normalized_files.push(TerraformSourceFile {
            name: file_name,
            content: file.content.clone(),
        });
    }

    let entries = fs::read_dir(project_dir_path)
        .map_err(|error| format!("No se pudo leer directorio del proyecto para validate: {error}"))?;

    for entry in entries {
        let dir_entry = entry.map_err(|error| format!("No se pudo leer entrada de directorio: {error}"))?;
        let path = dir_entry.path();
        if !path.is_file() {
            continue;
        }

        let Some(name_os) = path.file_name() else {
            continue;
        };

        let name = match name_os.to_str() {
            Some(value) => value.to_string(),
            None => continue,
        };

        if !name.to_lowercase().ends_with(".tf") {
            continue;
        }

        if provided_tf_names.contains(&name) {
            continue;
        }

        let _ = fs::remove_file(&path);
    }

    Ok(normalized_files)
}

fn to_file_uri(path: &PathBuf) -> String {
    let normalized = path.to_string_lossy().replace(' ', "%20");
    format!("file://{normalized}")
}

fn send_lsp_message(writer: &mut dyn Write, payload: &Value) -> Result<(), String> {
    let body = payload.to_string();
    let header = format!("Content-Length: {}\r\n\r\n", body.len());
    writer
        .write_all(header.as_bytes())
        .map_err(|error| format!("No se pudo escribir header LSP: {error}"))?;
    writer
        .write_all(body.as_bytes())
        .map_err(|error| format!("No se pudo escribir body LSP: {error}"))?;
    writer
        .flush()
        .map_err(|error| format!("No se pudo flush LSP: {error}"))?;
    Ok(())
}

fn severity_from_lsp(severity: Option<u64>) -> String {
    match severity {
        Some(1) => "error".to_string(),
        Some(2) => "warning".to_string(),
        Some(3) => "info".to_string(),
        Some(4) => "info".to_string(),
        _ => "error".to_string(),
    }
}

fn basename_from_uri(uri: &str) -> Option<String> {
    let without_scheme = uri.strip_prefix("file://").unwrap_or(uri);
    let normalized = without_scheme.replace('\\', "/");
    normalized
        .split('/')
        .next_back()
        .map(|value| value.replace("%20", " "))
}

fn diagnostics_from_lsp_notification(message: &Value) -> Vec<TerraformValidateDiagnostic> {
    let method = message.get("method").and_then(Value::as_str);
    if method != Some("textDocument/publishDiagnostics") {
        return vec![];
    }

    let params = match message.get("params") {
        Some(value) => value,
        None => return vec![],
    };

    let file_name = params
        .get("uri")
        .and_then(Value::as_str)
        .and_then(basename_from_uri);

    let diagnostics = params
        .get("diagnostics")
        .and_then(Value::as_array)
        .cloned()
        .unwrap_or_default();

    diagnostics
        .into_iter()
        .map(|diagnostic| {
            let message_text = diagnostic
                .get("message")
                .and_then(Value::as_str)
                .unwrap_or("Diagnóstico terraform-ls")
                .to_string();

            let summary = message_text.lines().next().unwrap_or("Diagnóstico terraform-ls").to_string();

            let start_line = diagnostic
                .get("range")
                .and_then(|range| range.get("start"))
                .and_then(|start| start.get("line"))
                .and_then(Value::as_u64)
                .map(|line| line as usize + 1);

            let start_column = diagnostic
                .get("range")
                .and_then(|range| range.get("start"))
                .and_then(|start| start.get("character"))
                .and_then(Value::as_u64)
                .map(|column| column as usize + 1);

            let end_line = diagnostic
                .get("range")
                .and_then(|range| range.get("end"))
                .and_then(|end| end.get("line"))
                .and_then(Value::as_u64)
                .map(|line| line as usize + 1);

            let end_column = diagnostic
                .get("range")
                .and_then(|range| range.get("end"))
                .and_then(|end| end.get("character"))
                .and_then(Value::as_u64)
                .map(|column| column as usize + 1);

            TerraformValidateDiagnostic {
                severity: severity_from_lsp(
                    diagnostic.get("severity").and_then(Value::as_u64),
                ),
                summary,
                detail: message_text,
                filename: file_name.clone(),
                start_line,
                start_column,
                end_line,
                end_column,
            }
        })
        .collect()
}

fn terraform_lsp_diagnostics_sync(
    project_dir: String,
    files: Vec<TerraformSourceFile>,
) -> Result<TerraformLspDiagnosticsResult, String> {
    if project_dir.trim().is_empty() {
        return Err("No se recibió directorio de proyecto para terraform-ls.".to_string());
    }

    let project_dir_path = PathBuf::from(project_dir.trim());
    if !project_dir_path.exists() {
        return Err("El directorio del proyecto no existe para terraform-ls.".to_string());
    }

    let normalized_files = sync_project_tf_files(&project_dir_path, &files)?;

    let mut child = match Command::new("terraform-ls")
        .arg("serve")
        .current_dir(&project_dir_path)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::null())
        .spawn()
    {
        Ok(child) => child,
        Err(error) if error.kind() == std::io::ErrorKind::NotFound => {
            return Err(
                "terraform-ls no está instalado o no está en PATH. Instálalo (HashiCorp Terraform Language Server) y reinicia la app."
                    .to_string(),
            )
        }
        Err(error) => return Err(format!("No se pudo iniciar terraform-ls: {error}")),
    };

    let mut stdin = child
        .stdin
        .take()
        .ok_or_else(|| "terraform-ls no expuso stdin".to_string())?;
    let stdout = child
        .stdout
        .take()
        .ok_or_else(|| "terraform-ls no expuso stdout".to_string())?;

    let (tx, rx) = mpsc::channel::<Value>();
    std::thread::spawn(move || {
        let mut reader = BufReader::new(stdout);
        loop {
            let mut content_length: usize = 0;
            loop {
                let mut line = String::new();
                match reader.read_line(&mut line) {
                    Ok(0) => return,
                    Ok(_) => {
                        let trimmed = line.trim_end_matches(['\r', '\n']);
                        if trimmed.is_empty() {
                            break;
                        }
                        let lower = trimmed.to_ascii_lowercase();
                        if let Some(value) = lower.strip_prefix("content-length:") {
                            content_length = value.trim().parse::<usize>().unwrap_or(0);
                        }
                    }
                    Err(_) => return,
                }
            }

            if content_length == 0 {
                continue;
            }

            let mut body = vec![0u8; content_length];
            if reader.read_exact(&mut body).is_err() {
                return;
            }

            if let Ok(text) = String::from_utf8(body) {
                if let Ok(json_value) = serde_json::from_str::<Value>(&text) {
                    let _ = tx.send(json_value);
                }
            }
        }
    });

    let root_uri = to_file_uri(&project_dir_path);

    send_lsp_message(
        &mut stdin,
        &json!({
            "jsonrpc": "2.0",
            "id": 1,
            "method": "initialize",
            "params": {
                "processId": std::process::id(),
                "clientInfo": { "name": "ddf", "version": "0.1.0" },
                "rootUri": root_uri,
                "workspaceFolders": [
                    { "uri": to_file_uri(&project_dir_path), "name": "ddf" }
                ],
                "capabilities": {}
            }
        }),
    )?;

    let wait_init_until = Instant::now() + Duration::from_millis(1200);
    while Instant::now() < wait_init_until {
        match rx.recv_timeout(Duration::from_millis(150)) {
            Ok(msg) => {
                if msg.get("id").and_then(Value::as_u64) == Some(1) {
                    break;
                }
            }
            Err(mpsc::RecvTimeoutError::Timeout) => continue,
            Err(_) => break,
        }
    }

    send_lsp_message(
        &mut stdin,
        &json!({
            "jsonrpc": "2.0",
            "method": "initialized",
            "params": {}
        }),
    )?;

    for file in &normalized_files {
        let file_uri = to_file_uri(&project_dir_path.join(&file.name));
        send_lsp_message(
            &mut stdin,
            &json!({
                "jsonrpc": "2.0",
                "method": "textDocument/didOpen",
                "params": {
                    "textDocument": {
                        "uri": file_uri,
                        "languageId": "terraform",
                        "version": 1,
                        "text": file.content,
                    }
                }
            }),
        )?;
    }

    let mut diagnostics = Vec::<TerraformValidateDiagnostic>::new();
    let collect_until = Instant::now() + Duration::from_millis(1500);
    while Instant::now() < collect_until {
        match rx.recv_timeout(Duration::from_millis(180)) {
            Ok(msg) => {
                diagnostics.extend(diagnostics_from_lsp_notification(&msg));
            }
            Err(mpsc::RecvTimeoutError::Timeout) => continue,
            Err(_) => break,
        }
    }

    let _ = send_lsp_message(
        &mut stdin,
        &json!({
            "jsonrpc": "2.0",
            "id": 2,
            "method": "shutdown",
            "params": Value::Null
        }),
    );
    let _ = send_lsp_message(
        &mut stdin,
        &json!({
            "jsonrpc": "2.0",
            "method": "exit",
            "params": Value::Null
        }),
    );
    let _ = child.kill();
    let _ = child.wait();

    Ok(TerraformLspDiagnosticsResult { diagnostics })
}

#[tauri::command]
pub async fn terraform_lsp_diagnostics(
    project_dir: String,
    files: Vec<TerraformSourceFile>,
) -> Result<TerraformLspDiagnosticsResult, String> {
    tauri::async_runtime::spawn_blocking(move || terraform_lsp_diagnostics_sync(project_dir, files))
        .await
        .map_err(|error| format!("Error interno ejecutando terraform-ls: {error}"))?
}

#[tauri::command]
pub async fn terraform_validate(project_dir: String, files: Vec<TerraformSourceFile>) -> Result<TerraformValidateResult, String> {
    tauri::async_runtime::spawn_blocking(move || terraform_validate_sync(project_dir, files))
        .await
        .map_err(|error| format!("Error interno ejecutando validate: {error}"))?
}

fn terraform_validate_sync(project_dir: String, files: Vec<TerraformSourceFile>) -> Result<TerraformValidateResult, String> {
    if project_dir.trim().is_empty() {
        return Err("No se recibió directorio de proyecto para validate.".to_string());
    }

    let project_dir_path = PathBuf::from(project_dir.trim());
    if !project_dir_path.exists() {
        return Err("El directorio del proyecto no existe para validate.".to_string());
    }

    let _ = sync_project_tf_files(&project_dir_path, &files)?;

    let terraform_data_dir = project_dir_path.join(".terraform");
    let needs_init = !terraform_data_dir.exists();
    let mut init_ran = false;

    if needs_init {
        let init_output = Command::new("terraform")
            .arg("init")
            .arg("-backend=false")
            .arg("-input=false")
            .arg("-no-color")
            .current_dir(&project_dir_path)
            .output()
            .map_err(|error| format!("No se pudo ejecutar terraform init: {error}"))?;

        init_ran = true;

        if !init_output.status.success() {
            let stderr = String::from_utf8_lossy(&init_output.stderr).trim().to_string();
            let stdout = String::from_utf8_lossy(&init_output.stdout).trim().to_string();
            let detail = if !stderr.is_empty() {
                stderr
            } else if !stdout.is_empty() {
                stdout
            } else {
                "terraform init terminó con error sin salida detallada.".to_string()
            };

            return Ok(TerraformValidateResult {
                ok: false,
                diagnostics: vec![TerraformValidateDiagnostic {
                    severity: "error".to_string(),
                    summary: "terraform init falló".to_string(),
                    detail,
                    filename: None,
                    start_line: None,
                    start_column: None,
                    end_line: None,
                    end_column: None,
                }],
                init_ran,
            });
        }
    }

    let validate_output = Command::new("terraform")
        .arg("validate")
        .arg("-json")
        .arg("-no-color")
        .current_dir(&project_dir_path)
        .output()
        .map_err(|error| format!("No se pudo ejecutar terraform validate: {error}"))?;

    let stdout = String::from_utf8_lossy(&validate_output.stdout).to_string();
    let stderr = String::from_utf8_lossy(&validate_output.stderr).trim().to_string();

    let mut diagnostics = Vec::<TerraformValidateDiagnostic>::new();
    let mut parsed_ok_from_json = validate_output.status.success();

    if let Ok(parsed) = serde_json::from_str::<TerraformValidateJson>(&stdout) {
        if let Some(valid) = parsed.valid {
            parsed_ok_from_json = valid;
        }

        diagnostics = parsed
            .diagnostics
            .unwrap_or_default()
            .into_iter()
            .map(|diagnostic| TerraformValidateDiagnostic {
                severity: diagnostic
                    .severity
                    .unwrap_or_else(|| "error".to_string())
                    .to_lowercase(),
                summary: diagnostic
                    .summary
                    .unwrap_or_else(|| "Diagnóstico de Terraform".to_string()),
                detail: diagnostic.detail.unwrap_or_default(),
                filename: diagnostic
                    .range
                    .as_ref()
                    .and_then(|range| range.filename.clone()),
                start_line: diagnostic
                    .range
                    .as_ref()
                    .and_then(|range| range.start.as_ref())
                    .and_then(|position| position.line),
                start_column: diagnostic
                    .range
                    .as_ref()
                    .and_then(|range| range.start.as_ref())
                    .and_then(|position| position.column),
                end_line: diagnostic
                    .range
                    .as_ref()
                    .and_then(|range| range.end.as_ref())
                    .and_then(|position| position.line),
                end_column: diagnostic
                    .range
                    .as_ref()
                    .and_then(|range| range.end.as_ref())
                    .and_then(|position| position.column),
            })
            .collect();
    }

    if diagnostics.is_empty() && (!validate_output.status.success() || !stderr.is_empty()) {
        diagnostics.push(TerraformValidateDiagnostic {
            severity: "error".to_string(),
            summary: "terraform validate falló".to_string(),
            detail: if !stderr.is_empty() {
                stderr
            } else {
                stdout.trim().to_string()
            },
            filename: None,
            start_line: None,
            start_column: None,
            end_line: None,
            end_column: None,
        });
    }

    let result = TerraformValidateResult {
        ok: validate_output.status.success() && parsed_ok_from_json,
        diagnostics,
        init_ran,
    };

    Ok(result)
}