use std::process::Command;

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
}

#[tauri::command]
pub fn terraform_validate(project_dir: String) -> Result<TerraformValidateResult, String> {
    if project_dir.trim().is_empty() {
        return Err("No se recibió un directorio de proyecto para validar.".to_string());
    }

    let init_output = Command::new("terraform")
        .arg("init")
        .arg("-backend=false")
        .arg("-input=false")
        .arg("-no-color")
        .current_dir(&project_dir)
        .output()
        .map_err(|error| format!("No se pudo ejecutar terraform init: {error}"))?;

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
        });
    }

    let validate_output = Command::new("terraform")
        .arg("validate")
        .arg("-json")
        .arg("-no-color")
        .current_dir(&project_dir)
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

    Ok(TerraformValidateResult {
        ok: validate_output.status.success() && parsed_ok_from_json,
        diagnostics,
    })
}