use std::{
    fs,
    path::PathBuf,
    process::Command,
};

use serde::{Deserialize, Serialize};

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

    if files.is_empty() {
        return Err("No hay archivos Terraform para validar.".to_string());
    }

    let mut provided_tf_names = std::collections::HashSet::<String>::new();

    for file in &files {
        let file_name = sanitize_tf_file_name(&file.name)?;
        provided_tf_names.insert(file_name.clone());

        let file_path = project_dir_path.join(&file_name);
        fs::write(&file_path, &file.content)
            .map_err(|error| format!("No se pudo escribir archivo temporal '{}': {error}", file_name))?;
    }

    let entries = fs::read_dir(&project_dir_path)
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