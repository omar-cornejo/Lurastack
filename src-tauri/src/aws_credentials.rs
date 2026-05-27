use serde::Serialize;
use std::collections::HashMap;
use std::fs;
use std::path::PathBuf;

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct AwsProfile {
    pub name: String,
    pub region: Option<String>,
    pub has_credentials: bool,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct AwsEnvCredentials {
    pub access_key_id: Option<String>,
    pub secret_access_key: Option<String>,
    pub session_token: Option<String>,
    pub region: Option<String>,
    pub is_complete: bool,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct AwsProfileCredentials {
    pub access_key_id: String,
    pub secret_access_key: String,
    pub session_token: Option<String>,
    pub region: Option<String>,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct AwsPaths {
    pub credentials_path: String,
    pub credentials_exists: bool,
    pub config_path: String,
    pub config_exists: bool,
    pub default_credentials_path: String,
    pub default_config_path: String,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct AwsEnvSource {
    pub process_cwd: String,
    pub env_file_path: Option<String>,
    pub env_file_exists: bool,
}

fn parse_ini(text: &str) -> HashMap<String, HashMap<String, String>> {
    let mut sections: HashMap<String, HashMap<String, String>> = HashMap::new();
    let mut current: Option<String> = None;

    for raw_line in text.lines() {
        let line = raw_line.trim();
        if line.is_empty() || line.starts_with('#') || line.starts_with(';') {
            continue;
        }
        if line.starts_with('[') && line.ends_with(']') {
            let section_name = line[1..line.len() - 1].trim().to_string();
            sections.entry(section_name.clone()).or_default();
            current = Some(section_name);
            continue;
        }
        if let Some(section) = &current {
            if let Some(eq_idx) = line.find('=') {
                let key = line[..eq_idx].trim().to_lowercase();
                let mut value = line[eq_idx + 1..].trim().to_string();
                if let Some(comment_idx) = value.find('#') {
                    value = value[..comment_idx].trim().to_string();
                }
                if !key.is_empty() {
                    sections
                        .entry(section.clone())
                        .or_default()
                        .insert(key, value);
                }
            }
        }
    }
    sections
}

fn default_aws_credentials_path() -> Option<PathBuf> {
    dirs::home_dir().map(|h| h.join(".aws").join("credentials"))
}

fn default_aws_config_path() -> Option<PathBuf> {
    dirs::home_dir().map(|h| h.join(".aws").join("config"))
}

fn resolve_credentials_path(custom: Option<&str>) -> Option<PathBuf> {
    if let Some(c) = custom.map(str::trim).filter(|s| !s.is_empty()) {
        return Some(PathBuf::from(c));
    }
    if let Ok(env_path) = std::env::var("AWS_SHARED_CREDENTIALS_FILE") {
        if !env_path.is_empty() {
            return Some(PathBuf::from(env_path));
        }
    }
    default_aws_credentials_path()
}

fn resolve_config_path(custom: Option<&str>) -> Option<PathBuf> {
    if let Some(c) = custom.map(str::trim).filter(|s| !s.is_empty()) {
        return Some(PathBuf::from(c));
    }
    if let Ok(env_path) = std::env::var("AWS_CONFIG_FILE") {
        if !env_path.is_empty() {
            return Some(PathBuf::from(env_path));
        }
    }
    default_aws_config_path()
}

fn load_credentials_ini(custom: Option<&str>) -> HashMap<String, HashMap<String, String>> {
    let Some(path) = resolve_credentials_path(custom) else { return HashMap::new(); };
    match fs::read_to_string(&path) {
        Ok(text) => parse_ini(&text),
        Err(_) => HashMap::new(),
    }
}

fn load_config_ini(custom: Option<&str>) -> HashMap<String, HashMap<String, String>> {
    let Some(path) = resolve_config_path(custom) else { return HashMap::new(); };
    let text = match fs::read_to_string(&path) {
        Ok(text) => text,
        Err(_) => return HashMap::new(),
    };
    let raw = parse_ini(&text);
    let mut normalized: HashMap<String, HashMap<String, String>> = HashMap::new();
    for (section, kvs) in raw {
        let name = if section == "default" {
            "default".to_string()
        } else if let Some(rest) = section.strip_prefix("profile ") {
            rest.trim().to_string()
        } else {
            section
        };
        normalized.insert(name, kvs);
    }
    normalized
}

#[tauri::command]
pub async fn list_aws_profiles(
    credentials_path: Option<String>,
    config_path: Option<String>,
) -> Result<Vec<AwsProfile>, String> {
    let creds = load_credentials_ini(credentials_path.as_deref());
    let config = load_config_ini(config_path.as_deref());

    let mut profiles: Vec<AwsProfile> = creds
        .keys()
        .map(|name| {
            let region = config
                .get(name)
                .and_then(|kvs| kvs.get("region"))
                .filter(|v| !v.is_empty())
                .cloned();
            AwsProfile {
                name: name.clone(),
                region,
                has_credentials: true,
            }
        })
        .collect();

    profiles.sort_by(|a, b| {
        if a.name == "default" {
            std::cmp::Ordering::Less
        } else if b.name == "default" {
            std::cmp::Ordering::Greater
        } else {
            a.name.cmp(&b.name)
        }
    });

    Ok(profiles)
}

fn mask_access_key(key: &str) -> String {
    if key.len() <= 4 {
        return "****".to_string();
    }
    let last4 = &key[key.len() - 4..];
    format!("****{last4}")
}

#[tauri::command]
pub async fn get_aws_env_credentials(
    env_file: Option<String>,
) -> Result<AwsEnvCredentials, String> {
    let env_file = env_file.as_deref();
    let access_key_raw = read_env_or_file(env_file, "AWS_ACCESS_KEY_ID");
    let secret_raw = read_env_or_file(env_file, "AWS_SECRET_ACCESS_KEY");
    let token_raw = read_env_or_file(env_file, "AWS_SESSION_TOKEN");
    let region = read_env_or_file(env_file, "AWS_DEFAULT_REGION")
        .or_else(|| read_env_or_file(env_file, "AWS_REGION"));

    let is_complete = access_key_raw.is_some() && secret_raw.is_some() && region.is_some();

    Ok(AwsEnvCredentials {
        access_key_id: access_key_raw.as_deref().map(mask_access_key),
        secret_access_key: secret_raw.as_ref().map(|_| "****".to_string()),
        session_token: token_raw.as_ref().map(|_| "(establecido)".to_string()),
        region,
        is_complete,
    })
}

#[tauri::command]
pub async fn get_aws_profile_credentials(
    profile: String,
    credentials_path: Option<String>,
    config_path: Option<String>,
) -> Result<AwsProfileCredentials, String> {
    let creds = load_credentials_ini(credentials_path.as_deref());
    let section = creds
        .get(&profile)
        .ok_or_else(|| format!("El perfil '{profile}' no existe en el archivo de credenciales"))?;

    let access_key_id = section
        .get("aws_access_key_id")
        .filter(|v| !v.is_empty())
        .cloned()
        .ok_or_else(|| format!("El perfil '{profile}' no tiene aws_access_key_id"))?;

    let secret_access_key = section
        .get("aws_secret_access_key")
        .filter(|v| !v.is_empty())
        .cloned()
        .ok_or_else(|| format!("El perfil '{profile}' no tiene aws_secret_access_key"))?;

    let session_token = section
        .get("aws_session_token")
        .filter(|v| !v.is_empty())
        .cloned();

    let config = load_config_ini(config_path.as_deref());
    let region = config
        .get(&profile)
        .and_then(|kvs| kvs.get("region"))
        .filter(|v| !v.is_empty())
        .cloned();

    Ok(AwsProfileCredentials {
        access_key_id,
        secret_access_key,
        session_token,
        region,
    })
}

#[tauri::command]
pub async fn get_aws_paths() -> Result<AwsPaths, String> {
    let default_creds = default_aws_credentials_path()
        .map(|p| p.to_string_lossy().to_string())
        .unwrap_or_default();
    let default_cfg = default_aws_config_path()
        .map(|p| p.to_string_lossy().to_string())
        .unwrap_or_default();

    let creds_path = resolve_credentials_path(None)
        .map(|p| p.to_string_lossy().to_string())
        .unwrap_or_default();
    let cfg_path = resolve_config_path(None)
        .map(|p| p.to_string_lossy().to_string())
        .unwrap_or_default();

    let creds_exists = !creds_path.is_empty() && PathBuf::from(&creds_path).exists();
    let cfg_exists = !cfg_path.is_empty() && PathBuf::from(&cfg_path).exists();

    Ok(AwsPaths {
        credentials_path: creds_path,
        credentials_exists: creds_exists,
        config_path: cfg_path,
        config_exists: cfg_exists,
        default_credentials_path: default_creds,
        default_config_path: default_cfg,
    })
}

#[tauri::command]
pub async fn check_aws_path_exists(path: String) -> Result<bool, String> {
    if path.trim().is_empty() {
        return Ok(false);
    }
    Ok(PathBuf::from(path).exists())
}

#[tauri::command]
pub async fn get_aws_env_source() -> Result<AwsEnvSource, String> {
    let cwd = std::env::current_dir()
        .map(|p| p.to_string_lossy().to_string())
        .unwrap_or_else(|_| "(desconocido)".to_string());
    let env_file_path = std::env::var("LURASTACK_ENV_FILE").ok().filter(|s| !s.is_empty());
    let env_file_exists = env_file_path
        .as_deref()
        .map(|p| PathBuf::from(p).exists())
        .unwrap_or(false);
    Ok(AwsEnvSource {
        process_cwd: cwd,
        env_file_path,
        env_file_exists,
    })
}

fn read_env_var_from_file(path: &str, key: &str) -> Option<String> {
    let text = fs::read_to_string(path).ok()?;
    for line in text.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let line = line.strip_prefix("export ").unwrap_or(line);
        if let Some(eq_idx) = line.find('=') {
            let k = line[..eq_idx].trim();
            if k == key {
                let mut v = line[eq_idx + 1..].trim().to_string();
                if (v.starts_with('"') && v.ends_with('"') && v.len() >= 2)
                    || (v.starts_with('\'') && v.ends_with('\'') && v.len() >= 2)
                {
                    v = v[1..v.len() - 1].to_string();
                }
                return Some(v);
            }
        }
    }
    None
}

fn read_env_or_file(env_file: Option<&str>, key: &str) -> Option<String> {
    if let Some(path) = env_file {
        if let Some(v) = read_env_var_from_file(path, key) {
            if !v.is_empty() {
                return Some(v);
            }
        }
    }
    std::env::var(key).ok().filter(|v| !v.is_empty())
}

#[tauri::command]
pub async fn resolve_aws_env_credentials(
    env_file: Option<String>,
) -> Result<AwsProfileCredentials, String> {
    let env_file = env_file.as_deref();
    let access_key_id = read_env_or_file(env_file, "AWS_ACCESS_KEY_ID")
        .ok_or_else(|| "AWS_ACCESS_KEY_ID no está definida".to_string())?;
    let secret_access_key = read_env_or_file(env_file, "AWS_SECRET_ACCESS_KEY")
        .ok_or_else(|| "AWS_SECRET_ACCESS_KEY no está definida".to_string())?;
    let session_token = read_env_or_file(env_file, "AWS_SESSION_TOKEN");
    let region = read_env_or_file(env_file, "AWS_DEFAULT_REGION")
        .or_else(|| read_env_or_file(env_file, "AWS_REGION"));

    Ok(AwsProfileCredentials {
        access_key_id,
        secret_access_key,
        session_token,
        region,
    })
}
