use std::{
    collections::HashMap,
    fs,
    io::{BufRead, BufReader, Read, Write},
    path::{Path, PathBuf},
    process::{ChildStdin, Command, Stdio},
    sync::{mpsc, Arc, Mutex},
    time::{Duration, Instant},
};

use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use tauri::Emitter;

pub struct TerraformInteractiveState {
    pub stdin: Arc<Mutex<Option<ChildStdin>>>,
    pub current_pid: Arc<Mutex<Option<u32>>>,
}

impl Default for TerraformInteractiveState {
    fn default() -> Self {
        Self {
            stdin: Arc::new(Mutex::new(None)),
            current_pid: Arc::new(Mutex::new(None)),
        }
    }
}

#[tauri::command]
pub fn terraform_cancel(
    state: tauri::State<'_, TerraformInteractiveState>,
) -> Result<bool, String> {
    let pid_opt = *state
        .current_pid
        .lock()
        .map_err(|error| format!("Error de lock: {error}"))?;
    let Some(pid) = pid_opt else {
        return Ok(false);
    };
    #[cfg(unix)]
    {
        use std::process::Command as StdCommand;
        // Send SIGINT first (graceful), then SIGTERM as a follow-up if still alive.
        let _ = StdCommand::new("kill")
            .arg("-INT")
            .arg(pid.to_string())
            .status();
        std::thread::sleep(Duration::from_millis(800));
        let _ = StdCommand::new("kill")
            .arg("-TERM")
            .arg(pid.to_string())
            .status();
    }
    #[cfg(windows)]
    {
        use std::process::Command as StdCommand;
        let _ = StdCommand::new("taskkill")
            .args(["/PID", &pid.to_string(), "/T", "/F"])
            .status();
    }
    Ok(true)
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct AwsCredentials {
    #[serde(default)]
    pub mode: Option<String>,
    #[serde(default)]
    pub access_key_id: String,
    #[serde(default)]
    pub secret_access_key: String,
    #[serde(default)]
    pub session_token: Option<String>,
    #[serde(default)]
    pub region: String,
    #[serde(default)]
    pub profile: Option<String>,
    #[serde(default)]
    pub credentials_path: Option<String>,
    #[serde(default)]
    pub config_path: Option<String>,
    #[serde(default)]
    pub env_file_path: Option<String>,
}

impl AwsCredentials {
    fn resolve(mut self) -> Result<Self, String> {
        let mode = self.mode.as_deref().unwrap_or("manual");
        match mode {
            "profile" => {
                let profile = self
                    .profile
                    .as_deref()
                    .map(str::trim)
                    .filter(|s| !s.is_empty())
                    .ok_or_else(|| "Falta el nombre del perfil AWS".to_string())?;
                let resolved = crate::aws_credentials::resolve_profile_credentials_sync(
                    profile,
                    self.credentials_path.as_deref(),
                    self.config_path.as_deref(),
                )?;
                self.access_key_id = resolved.access_key_id;
                self.secret_access_key = resolved.secret_access_key;
                self.session_token = resolved.session_token.or(self.session_token);
                if self.region.trim().is_empty() {
                    if let Some(r) = resolved.region {
                        self.region = r;
                    }
                }
            }
            "env" => {
                let resolved = crate::aws_credentials::resolve_env_credentials_sync(
                    self.env_file_path.as_deref(),
                )?;
                self.access_key_id = resolved.access_key_id;
                self.secret_access_key = resolved.secret_access_key;
                self.session_token = resolved.session_token.or(self.session_token);
                if self.region.trim().is_empty() {
                    if let Some(r) = resolved.region {
                        self.region = r;
                    }
                }
            }
            _ => {}
        }
        if self.access_key_id.trim().is_empty() {
            return Err("AWS_ACCESS_KEY_ID vacío tras resolución de credenciales".to_string());
        }
        if self.secret_access_key.trim().is_empty() {
            return Err("AWS_SECRET_ACCESS_KEY vacío tras resolución de credenciales".to_string());
        }
        if self.region.trim().is_empty() {
            return Err("AWS region vacía tras resolución de credenciales".to_string());
        }
        Ok(self)
    }
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
    extra_env: Option<&HashMap<String, String>>,
) -> Result<(), String> {
    emit_output(window, "\r\n\x1b[36m→ terraform init\x1b[0m\r\n");

    let mut command = Command::new("terraform");
    command
        .arg("init")
        .arg("-input=false")
        .arg("-no-color")
        .current_dir(project_dir_path);

    if let Some(env) = extra_env {
        for (k, v) in env {
            command.env(k, v);
        }
    }

    command
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
                    while let Ok(line) = rx.try_recv() {
                        emit_output(window, &line);
                    }
                    break;
                }
            }
            Err(_) => break,
        }
    }

    let status = child
        .wait()
        .map_err(|error| format!("Error esperando terraform init: {error}"))?;
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
    pid_arc: Option<&Arc<Mutex<Option<u32>>>>,
    extra_env: Option<&HashMap<String, String>>,
) -> Result<bool, String> {
    let mut cmd = Command::new("terraform");
    for arg in args {
        cmd.arg(arg);
    }
    cmd.current_dir(project_dir_path);

    if let Some(env) = extra_env {
        for (k, v) in env {
            cmd.env(k, v);
        }
    }

    cmd.env("AWS_ACCESS_KEY_ID", &aws_credentials.access_key_id)
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

    let mut child = cmd.spawn().map_err(|error| {
        format!(
            "No se pudo iniciar terraform {}: {error}",
            args.first().unwrap_or(&"")
        )
    })?;

    if let Some(pid_arc) = pid_arc {
        if let Ok(mut guard) = pid_arc.lock() {
            *guard = Some(child.id());
        }
    }

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

    let status = child
        .wait()
        .map_err(|error| format!("Error esperando terraform: {error}"))?;
    if let Some(pid_arc) = pid_arc {
        if let Ok(mut guard) = pid_arc.lock() {
            *guard = None;
        }
    }
    Ok(status.success())
}

fn run_terraform_interactive_inner(
    window: &tauri::Window,
    args: &[&str],
    project_dir_path: &PathBuf,
    aws_credentials: &AwsCredentials,
    stdin_arc: &Arc<Mutex<Option<ChildStdin>>>,
    pid_arc: &Arc<Mutex<Option<u32>>>,
    extra_env: Option<&HashMap<String, String>>,
) -> Result<bool, String> {
    let mut cmd = Command::new("terraform");
    for arg in args {
        cmd.arg(arg);
    }
    cmd.current_dir(project_dir_path);

    if let Some(env) = extra_env {
        for (k, v) in env {
            cmd.env(k, v);
        }
    }

    cmd.env("AWS_ACCESS_KEY_ID", &aws_credentials.access_key_id)
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

    let mut child = cmd.spawn().map_err(|error| {
        format!(
            "No se pudo iniciar terraform {}: {error}",
            args.first().unwrap_or(&"")
        )
    })?;

    *pid_arc.lock().unwrap() = Some(child.id());

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
                    let normalized = text
                        .replace("\r\n", "\n")
                        .replace('\r', "\n")
                        .replace('\n', "\r\n");
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
                    let normalized = text
                        .replace("\r\n", "\n")
                        .replace('\r', "\n")
                        .replace('\n', "\r\n");
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

    let status = child
        .wait()
        .map_err(|error| format!("Error esperando terraform: {error}"))?;
    *stdin_arc.lock().unwrap() = None;
    *pid_arc.lock().unwrap() = None;
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
    extra_env: Option<HashMap<String, String>>,
    state: tauri::State<'_, TerraformInteractiveState>,
) -> Result<bool, String> {
    let pid_arc = state.current_pid.clone();
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let aws_credentials = aws_credentials.resolve()?;
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            sync_project_tf_files(&project_dir_path, &files)?;
        }

        emit_output(&window, "\x1b[1m\x1b[35m╔══════════════════════════════╗\r\n║     terraform plan           ║\r\n╚══════════════════════════════╝\x1b[0m\r\n");

        terraform_init_for_deploy(&window, &project_dir_path, &aws_credentials, extra_env.as_ref())?;

        emit_output(&window, "\r\n\x1b[36m→ terraform plan\x1b[0m\r\n");
        let success = run_terraform_streaming(
            &window,
            &["plan", "-no-color", "-input=false"],
            &project_dir_path,
            &aws_credentials,
            Some(&pid_arc),
            extra_env.as_ref(),
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
    extra_env: Option<HashMap<String, String>>,
    state: tauri::State<'_, TerraformInteractiveState>,
) -> Result<bool, String> {
    let pid_arc = state.current_pid.clone();
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let aws_credentials = aws_credentials.resolve()?;
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            sync_project_tf_files(&project_dir_path, &files)?;
        }

        emit_output(&window, "\x1b[1m\x1b[35m╔══════════════════════════════╗\r\n║   terraform plan -destroy    ║\r\n╚══════════════════════════════╝\x1b[0m\r\n");

        terraform_init_for_deploy(&window, &project_dir_path, &aws_credentials, extra_env.as_ref())?;

        emit_output(&window, "\r\n\x1b[36m→ terraform plan -destroy\x1b[0m\r\n");
        let success = run_terraform_streaming(
            &window,
            &["plan", "-destroy", "-no-color", "-input=false"],
            &project_dir_path,
            &aws_credentials,
            Some(&pid_arc),
            extra_env.as_ref(),
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
    extra_env: Option<HashMap<String, String>>,
    state: tauri::State<'_, TerraformInteractiveState>,
) -> Result<bool, String> {
    let stdin_arc = state.stdin.clone();
    let pid_arc = state.current_pid.clone();
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let aws_credentials = aws_credentials.resolve()?;
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            sync_project_tf_files(&project_dir_path, &files)?;
        }

        emit_output(&window, "\x1b[1m\x1b[35m╔══════════════════════════════╗\r\n║     terraform apply          ║\r\n╚══════════════════════════════╝\x1b[0m\r\n");

        terraform_init_for_deploy(&window, &project_dir_path, &aws_credentials, extra_env.as_ref())?;

        emit_output(&window, "\r\n\x1b[36m→ terraform apply\x1b[0m\r\n");
        let success = run_terraform_interactive_inner(
            &window,
            &["apply", "-no-color"],
            &project_dir_path,
            &aws_credentials,
            &stdin_arc,
            &pid_arc,
            extra_env.as_ref(),
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
    extra_env: Option<HashMap<String, String>>,
    state: tauri::State<'_, TerraformInteractiveState>,
) -> Result<bool, String> {
    let stdin_arc = state.stdin.clone();
    let pid_arc = state.current_pid.clone();
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let aws_credentials = aws_credentials.resolve()?;
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            sync_project_tf_files(&project_dir_path, &files)?;
        }

        emit_output(&window, "\x1b[1m\x1b[35m╔══════════════════════════════╗\r\n║    terraform destroy         ║\r\n╚══════════════════════════════╝\x1b[0m\r\n");

        terraform_init_for_deploy(&window, &project_dir_path, &aws_credentials, extra_env.as_ref())?;

        emit_output(&window, "\r\n\x1b[36m→ terraform destroy\x1b[0m\r\n");
        let success = run_terraform_interactive_inner(
            &window,
            &["destroy", "-no-color"],
            &project_dir_path,
            &aws_credentials,
            &stdin_arc,
            &pid_arc,
            extra_env.as_ref(),
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

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TerraformShowResource {
    address: String,
    #[serde(rename = "type")]
    type_name: String,
    name: String,
    mode: String,
    values: Value,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TerraformShowResult {
    has_state: bool,
    resources: Vec<TerraformShowResource>,
    state_signature: Option<String>,
}

fn read_state_signature(project_dir_path: &Path) -> Option<String> {
    let state_file = project_dir_path.join("terraform.tfstate");
    let metadata = fs::metadata(&state_file).ok()?;
    let len = metadata.len();
    let modified_nanos = metadata
        .modified()
        .ok()
        .and_then(|time| time.duration_since(std::time::UNIX_EPOCH).ok())
        .map(|duration| duration.as_nanos())
        .unwrap_or(0);
    Some(format!("{len}-{modified_nanos}"))
}

fn collect_state_resources(module: &Value, acc: &mut Vec<TerraformShowResource>) {
    if let Some(resources) = module.get("resources").and_then(Value::as_array) {
        for resource in resources {
            let address = resource
                .get("address")
                .and_then(Value::as_str)
                .unwrap_or("")
                .to_string();
            let type_name = resource
                .get("type")
                .and_then(Value::as_str)
                .unwrap_or("")
                .to_string();
            let name = resource
                .get("name")
                .and_then(Value::as_str)
                .unwrap_or("")
                .to_string();
            let mode = resource
                .get("mode")
                .and_then(Value::as_str)
                .unwrap_or("managed")
                .to_string();
            let values = resource.get("values").cloned().unwrap_or(Value::Null);

            if address.is_empty() || type_name.is_empty() {
                continue;
            }

            acc.push(TerraformShowResource {
                address,
                type_name,
                name,
                mode,
                values,
            });
        }
    }

    if let Some(child_modules) = module.get("child_modules").and_then(Value::as_array) {
        for child in child_modules {
            collect_state_resources(child, acc);
        }
    }
}

#[tauri::command]
pub async fn terraform_show(
    project_dir: String,
    files: Vec<TerraformSourceFile>,
    aws_credentials: AwsCredentials,
    extra_env: Option<HashMap<String, String>>,
) -> Result<TerraformShowResult, String> {
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Err("No se recibió directorio de proyecto.".to_string());
        }
        let aws_credentials = aws_credentials.resolve()?;
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Err("El directorio del proyecto no existe.".to_string());
        }

        if !files.is_empty() {
            let _ = sync_project_tf_files(&project_dir_path, &files);
        }

        let state_file = project_dir_path.join("terraform.tfstate");
        if !state_file.exists() {
            return Ok(TerraformShowResult {
                has_state: false,
                resources: Vec::new(),
                state_signature: None,
            });
        }
        let state_signature = read_state_signature(&project_dir_path);

        let mut cmd = Command::new("terraform");
        cmd.arg("show")
            .arg("-json")
            .arg("-no-color")
            .current_dir(&project_dir_path);

        if let Some(env) = extra_env.as_ref() {
            for (k, v) in env {
                cmd.env(k, v);
            }
        }

        cmd.env("AWS_ACCESS_KEY_ID", &aws_credentials.access_key_id)
            .env("AWS_SECRET_ACCESS_KEY", &aws_credentials.secret_access_key)
            .env("AWS_DEFAULT_REGION", &aws_credentials.region)
            .stdout(Stdio::piped())
            .stderr(Stdio::piped());

        if let Some(token) = aws_credentials.session_token.as_deref() {
            if !token.trim().is_empty() {
                cmd.env("AWS_SESSION_TOKEN", token);
            }
        }

        let output = cmd
            .output()
            .map_err(|error| format!("No se pudo ejecutar terraform show: {error}"))?;

        if !output.status.success() {
            let stderr = String::from_utf8_lossy(&output.stderr).trim().to_string();
            return Err(if stderr.is_empty() {
                "terraform show falló".to_string()
            } else {
                format!("terraform show falló: {stderr}")
            });
        }

        let stdout = String::from_utf8_lossy(&output.stdout).to_string();
        if stdout.trim().is_empty() {
            return Ok(TerraformShowResult {
                has_state: false,
                resources: Vec::new(),
                state_signature: state_signature.clone(),
            });
        }

        let parsed: Value = serde_json::from_str(&stdout)
            .map_err(|error| format!("No se pudo parsear el JSON de terraform show: {error}"))?;

        let mut resources = Vec::<TerraformShowResource>::new();
        if let Some(root_module) = parsed.get("values").and_then(|v| v.get("root_module")) {
            collect_state_resources(root_module, &mut resources);
        }

        Ok(TerraformShowResult {
            has_state: !resources.is_empty(),
            resources,
            state_signature,
        })
    })
    .await
    .map_err(|error| format!("Error interno ejecutando terraform show: {error}"))?
}

#[tauri::command]
pub async fn terraform_state_signature(project_dir: String) -> Result<Option<String>, String> {
    tauri::async_runtime::spawn_blocking(move || {
        if project_dir.trim().is_empty() {
            return Ok(None);
        }
        let project_dir_path = PathBuf::from(project_dir.trim());
        if !project_dir_path.exists() {
            return Ok(None);
        }
        Ok(read_state_signature(&project_dir_path))
    })
    .await
    .map_err(|error| format!("Error interno leyendo signature: {error}"))?
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
        return Err(format!(
            "Solo se permiten archivos .tf en validate: {file_name}"
        ));
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
        fs::write(&file_path, &file.content).map_err(|error| {
            format!(
                "No se pudo escribir archivo temporal '{}': {error}",
                file_name
            )
        })?;

        normalized_files.push(TerraformSourceFile {
            name: file_name,
            content: file.content.clone(),
        });
    }

    let entries = fs::read_dir(project_dir_path).map_err(|error| {
        format!("No se pudo leer directorio del proyecto para validate: {error}")
    })?;

    for entry in entries {
        let dir_entry =
            entry.map_err(|error| format!("No se pudo leer entrada de directorio: {error}"))?;
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

fn to_file_uri(path: &Path) -> String {
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

            let summary = message_text
                .lines()
                .next()
                .unwrap_or("Diagnóstico terraform-ls")
                .to_string();

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
                severity: severity_from_lsp(diagnostic.get("severity").and_then(Value::as_u64)),
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
                "clientInfo": { "name": "lurastack", "version": "0.1.0" },
                "rootUri": root_uri,
                "workspaceFolders": [
                    { "uri": to_file_uri(&project_dir_path), "name": "lurastack" }
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
pub async fn terraform_validate(
    project_dir: String,
    files: Vec<TerraformSourceFile>,
) -> Result<TerraformValidateResult, String> {
    tauri::async_runtime::spawn_blocking(move || terraform_validate_sync(project_dir, files))
        .await
        .map_err(|error| format!("Error interno ejecutando validate: {error}"))?
}

fn terraform_validate_sync(
    project_dir: String,
    files: Vec<TerraformSourceFile>,
) -> Result<TerraformValidateResult, String> {
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
            let stderr = String::from_utf8_lossy(&init_output.stderr)
                .trim()
                .to_string();
            let stdout = String::from_utf8_lossy(&init_output.stdout)
                .trim()
                .to_string();
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
    let stderr = String::from_utf8_lossy(&validate_output.stderr)
        .trim()
        .to_string();

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

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn sanitize_tf_file_name_accepts_plain_tf_files() {
        assert_eq!(sanitize_tf_file_name("main.tf").unwrap(), "main.tf");
        assert_eq!(
            sanitize_tf_file_name("  outputs.tf  ").unwrap(),
            "outputs.tf"
        );
    }

    #[test]
    fn sanitize_tf_file_name_is_case_insensitive_on_extension() {
        assert_eq!(sanitize_tf_file_name("Main.TF").unwrap(), "Main.TF");
    }

    #[test]
    fn sanitize_tf_file_name_rejects_non_tf_files() {
        assert!(sanitize_tf_file_name("main.txt").is_err());
        assert!(sanitize_tf_file_name("secrets").is_err());
    }

    #[test]
    fn sanitize_tf_file_name_rejects_empty() {
        assert!(sanitize_tf_file_name("").is_err());
        assert!(sanitize_tf_file_name("   ").is_err());
    }

    #[test]
    fn sanitize_tf_file_name_strips_directory_components() {
        // Path traversal attempts are reduced to the basename, so they can't
        // escape the project dir.
        assert_eq!(
            sanitize_tf_file_name("../../etc/evil.tf").unwrap(),
            "evil.tf"
        );
        assert_eq!(
            sanitize_tf_file_name("subdir/nested.tf").unwrap(),
            "nested.tf"
        );
    }

    #[test]
    fn severity_from_lsp_maps_known_codes() {
        assert_eq!(severity_from_lsp(Some(1)), "error");
        assert_eq!(severity_from_lsp(Some(2)), "warning");
        assert_eq!(severity_from_lsp(Some(3)), "info");
        assert_eq!(severity_from_lsp(Some(4)), "info");
    }

    #[test]
    fn severity_from_lsp_defaults_to_error() {
        assert_eq!(severity_from_lsp(None), "error");
        assert_eq!(severity_from_lsp(Some(99)), "error");
    }

    #[test]
    fn basename_from_uri_extracts_filename() {
        assert_eq!(
            basename_from_uri("file:///home/user/project/main.tf").as_deref(),
            Some("main.tf"),
        );
    }

    #[test]
    fn basename_from_uri_decodes_spaces() {
        assert_eq!(
            basename_from_uri("file:///home/user/my%20project/main.tf").as_deref(),
            Some("main.tf"),
        );
        assert_eq!(
            basename_from_uri("file:///path/with%20space.tf").as_deref(),
            Some("with space.tf"),
        );
    }

    #[test]
    fn to_file_uri_encodes_spaces() {
        let uri = to_file_uri(Path::new("/home/user/my project/main.tf"));
        assert_eq!(uri, "file:///home/user/my%20project/main.tf");
    }

    #[test]
    fn collect_state_resources_extracts_top_level_resources() {
        let module = json!({
            "resources": [
                { "address": "aws_vpc.main", "type": "aws_vpc", "name": "main", "mode": "managed", "values": { "id": "vpc-1" } },
                { "address": "aws_subnet.a", "type": "aws_subnet", "name": "a", "mode": "managed", "values": {} }
            ]
        });
        let mut acc = Vec::new();
        collect_state_resources(&module, &mut acc);
        assert_eq!(acc.len(), 2);
        assert_eq!(acc[0].address, "aws_vpc.main");
        assert_eq!(acc[0].type_name, "aws_vpc");
    }

    #[test]
    fn collect_state_resources_recurses_into_child_modules() {
        let module = json!({
            "resources": [
                { "address": "aws_vpc.main", "type": "aws_vpc", "name": "main", "mode": "managed", "values": {} }
            ],
            "child_modules": [
                {
                    "resources": [
                        { "address": "module.x.aws_instance.web", "type": "aws_instance", "name": "web", "mode": "managed", "values": {} }
                    ]
                }
            ]
        });
        let mut acc = Vec::new();
        collect_state_resources(&module, &mut acc);
        assert_eq!(acc.len(), 2);
        assert!(acc.iter().any(|r| r.type_name == "aws_instance"));
    }

    #[test]
    fn collect_state_resources_skips_entries_missing_address_or_type() {
        let module = json!({
            "resources": [
                { "type": "aws_vpc", "name": "no_address", "mode": "managed", "values": {} },
                { "address": "x.y", "name": "no_type", "mode": "managed", "values": {} }
            ]
        });
        let mut acc = Vec::new();
        collect_state_resources(&module, &mut acc);
        assert_eq!(acc.len(), 0);
    }

    // ── AwsCredentials::resolve (manual mode) ──────────────────────────────

    fn manual_creds(access: &str, secret: &str, region: &str) -> AwsCredentials {
        serde_json::from_value(json!({
            "mode": "manual",
            "accessKeyId": access,
            "secretAccessKey": secret,
            "region": region,
        }))
        .unwrap()
    }

    #[test]
    fn resolve_manual_accepts_complete_credentials() {
        let resolved = manual_creds("AKIA", "secret", "eu-west-1").resolve();
        assert!(resolved.is_ok());
    }

    #[test]
    fn resolve_manual_rejects_empty_access_key() {
        assert!(manual_creds("", "secret", "eu-west-1").resolve().is_err());
        assert!(manual_creds("   ", "secret", "eu-west-1")
            .resolve()
            .is_err());
    }

    #[test]
    fn resolve_manual_rejects_empty_secret() {
        assert!(manual_creds("AKIA", "", "eu-west-1").resolve().is_err());
    }

    #[test]
    fn resolve_manual_rejects_empty_region() {
        assert!(manual_creds("AKIA", "secret", "").resolve().is_err());
        assert!(manual_creds("AKIA", "secret", "  ").resolve().is_err());
    }

    // ── diagnostics_from_lsp_notification ──────────────────────────────────

    #[test]
    fn lsp_diagnostics_ignores_non_publish_notifications() {
        let msg = json!({ "method": "window/logMessage", "params": {} });
        assert!(diagnostics_from_lsp_notification(&msg).is_empty());
    }

    #[test]
    fn lsp_diagnostics_handles_missing_params() {
        let msg = json!({ "method": "textDocument/publishDiagnostics" });
        assert!(diagnostics_from_lsp_notification(&msg).is_empty());
    }

    #[test]
    fn lsp_diagnostics_converts_zero_index_to_one_index() {
        let msg = json!({
            "method": "textDocument/publishDiagnostics",
            "params": {
                "uri": "file:///project/main.tf",
                "diagnostics": [{
                    "message": "first line\nmore detail",
                    "severity": 1,
                    "range": {
                        "start": { "line": 0, "character": 4 },
                        "end": { "line": 0, "character": 10 }
                    }
                }]
            }
        });
        let diags = diagnostics_from_lsp_notification(&msg);
        assert_eq!(diags.len(), 1);
        let d = &diags[0];
        // LSP is 0-indexed; output is 1-indexed.
        assert_eq!(d.start_line, Some(1));
        assert_eq!(d.start_column, Some(5));
        assert_eq!(d.end_column, Some(11));
        assert_eq!(d.severity, "error");
        assert_eq!(d.summary, "first line");
        assert_eq!(d.filename.as_deref(), Some("main.tf"));
    }

    #[test]
    fn lsp_diagnostics_tolerates_a_missing_range() {
        let msg = json!({
            "method": "textDocument/publishDiagnostics",
            "params": { "diagnostics": [{ "message": "no range" }] }
        });
        let diags = diagnostics_from_lsp_notification(&msg);
        assert_eq!(diags.len(), 1);
        assert_eq!(diags[0].start_line, None);
    }

    // ── read_state_signature ───────────────────────────────────────────────

    #[test]
    fn read_state_signature_is_none_without_a_state_file() {
        let dir = tempfile::tempdir().unwrap();
        assert!(read_state_signature(dir.path()).is_none());
    }

    #[test]
    fn read_state_signature_changes_with_content() {
        let dir = tempfile::tempdir().unwrap();
        let state = dir.path().join("terraform.tfstate");
        fs::write(&state, "{}").unwrap();
        let first = read_state_signature(dir.path());
        assert!(first.is_some());

        fs::write(&state, "{\"longer\": true}").unwrap();
        let second = read_state_signature(dir.path());
        assert!(second.is_some());
        assert_ne!(first, second);
    }
}
