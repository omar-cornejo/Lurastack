use std::fs;
use std::io::Write;
use std::path::PathBuf;
use std::sync::{Mutex, OnceLock};

use cocoon::Cocoon;
use keyring_core::{Entry, Error as KeyringError};
use serde::Serialize;
use zeroize::Zeroizing;

const SERVICE: &str = "com.omarantoniocornejo.lurastack";
const PROBE_USER: &str = "__keyring_probe__";
const FALLBACK_FILE: &str = "secrets.cocoon";
const ALLOWED_PROVIDERS: &[&str] = &["aws", "gcp", "azure"];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Backend {
    Keyring,
    EncryptedFile,
}

#[derive(Default)]
struct FallbackState {
    passphrase: Option<Zeroizing<String>>,
}

static BACKEND: OnceLock<Backend> = OnceLock::new();
static BACKEND_INIT_REASON: OnceLock<Option<String>> = OnceLock::new();
static FALLBACK: OnceLock<Mutex<FallbackState>> = OnceLock::new();

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct SecretsBackendInfo {
    pub backend: &'static str,
    pub available: bool,
    pub fallback_reason: Option<String>,
}

fn validate_provider(provider: &str) -> Result<(), String> {
    if ALLOWED_PROVIDERS.contains(&provider) {
        Ok(())
    } else {
        Err(format!("Proveedor no soportado: {provider}"))
    }
}

fn init_native_store() -> Result<(), KeyringError> {
    #[cfg(target_os = "macos")]
    {
        use apple_native_keyring_store::keychain::Store;
        keyring_core::set_default_store(Store::new_with_configuration(
            &std::collections::HashMap::new(),
        )?);
        Ok(())
    }
    #[cfg(target_os = "windows")]
    {
        use windows_native_keyring_store::Store;
        keyring_core::set_default_store(Store::new_with_configuration(
            &std::collections::HashMap::new(),
        )?);
        Ok(())
    }
    #[cfg(any(target_os = "linux", target_os = "freebsd"))]
    {
        use dbus_secret_service_keyring_store::Store;
        keyring_core::set_default_store(Store::new_with_configuration(
            &std::collections::HashMap::new(),
        )?);
        Ok(())
    }
    #[cfg(not(any(
        target_os = "macos",
        target_os = "windows",
        target_os = "linux",
        target_os = "freebsd"
    )))]
    {
        Err(KeyringError::NotSupportedByStore(
            "Plataforma sin keyring nativo soportado".to_string(),
        ))
    }
}

fn probe_keyring() -> Result<(), String> {
    init_native_store().map_err(|e| format!("No se pudo inicializar keyring nativo: {e}"))?;
    let entry = Entry::new(SERVICE, PROBE_USER)
        .map_err(|e| format!("No se pudo crear Entry de prueba: {e}"))?;
    match entry.get_password() {
        Ok(_) | Err(KeyringError::NoEntry) => Ok(()),
        Err(e) => Err(format!("Keyring nativo no disponible: {e}")),
    }
}

fn detect_backend() -> Backend {
    *BACKEND.get_or_init(|| match probe_keyring() {
        Ok(()) => {
            let _ = BACKEND_INIT_REASON.set(None);
            Backend::Keyring
        }
        Err(reason) => {
            let _ = BACKEND_INIT_REASON.set(Some(reason));
            Backend::EncryptedFile
        }
    })
}

fn fallback_path() -> Result<PathBuf, String> {
    let base = dirs::data_local_dir()
        .ok_or_else(|| "No se pudo determinar el directorio de datos local".to_string())?;
    let dir = base.join(SERVICE);
    fs::create_dir_all(&dir)
        .map_err(|e| format!("No se pudo crear el directorio de datos: {e}"))?;
    Ok(dir.join(FALLBACK_FILE))
}

fn fallback_state() -> &'static Mutex<FallbackState> {
    FALLBACK.get_or_init(|| Mutex::new(FallbackState::default()))
}

fn current_passphrase() -> Result<Zeroizing<String>, String> {
    let guard = fallback_state()
        .lock()
        .map_err(|_| "No se pudo bloquear el estado del fallback".to_string())?;
    guard
        .passphrase
        .clone()
        .ok_or_else(|| "Passphrase no configurada para el almacenamiento cifrado".to_string())
}

fn read_fallback_map() -> Result<std::collections::HashMap<String, String>, String> {
    let path = fallback_path()?;
    if !path.exists() {
        return Ok(std::collections::HashMap::new());
    }
    let pass = current_passphrase()?;
    let mut file = fs::File::open(&path)
        .map_err(|e| format!("No se pudo abrir el archivo cifrado: {e}"))?;
    let cocoon = Cocoon::parse_only(pass.as_bytes());
    let plain = cocoon
        .parse(&mut file)
        .map_err(|e| format!("No se pudo descifrar el archivo de secrets: {e:?}"))?;
    let parsed: std::collections::HashMap<String, String> = serde_json::from_slice(&plain)
        .map_err(|e| format!("No se pudo deserializar el archivo de secrets: {e}"))?;
    Ok(parsed)
}

fn write_fallback_map(
    map: &std::collections::HashMap<String, String>,
) -> Result<(), String> {
    let path = fallback_path()?;
    let pass = current_passphrase()?;
    let plain = serde_json::to_vec(map)
        .map_err(|e| format!("No se pudo serializar el mapa de secrets: {e}"))?;
    let mut cocoon = Cocoon::new(pass.as_bytes());
    let mut buf: Vec<u8> = Vec::new();
    cocoon
        .dump(plain, &mut buf)
        .map_err(|e| format!("No se pudo cifrar el archivo de secrets: {e:?}"))?;
    let tmp_path = path.with_extension("cocoon.tmp");
    let mut tmp = fs::File::create(&tmp_path)
        .map_err(|e| format!("No se pudo crear archivo temporal: {e}"))?;
    tmp.write_all(&buf)
        .map_err(|e| format!("No se pudo escribir archivo temporal: {e}"))?;
    drop(tmp);
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        let perms = fs::Permissions::from_mode(0o600);
        let _ = fs::set_permissions(&tmp_path, perms);
    }
    fs::rename(&tmp_path, &path)
        .map_err(|e| format!("No se pudo finalizar el archivo cifrado: {e}"))?;
    Ok(())
}

fn keyring_entry(provider: &str) -> Result<Entry, String> {
    Entry::new(SERVICE, provider).map_err(|e| format!("Entry::new falló: {e}"))
}

fn load_secret_internal(provider: &str) -> Result<Option<String>, String> {
    validate_provider(provider)?;
    match detect_backend() {
        Backend::Keyring => {
            let entry = keyring_entry(provider)?;
            match entry.get_password() {
                Ok(p) => Ok(Some(p)),
                Err(KeyringError::NoEntry) => Ok(None),
                Err(e) => Err(format!("No se pudo leer del keyring: {e}")),
            }
        }
        Backend::EncryptedFile => {
            let map = read_fallback_map()?;
            Ok(map.get(provider).cloned())
        }
    }
}

#[tauri::command]
pub async fn save_secret(provider: String, blob: String) -> Result<(), String> {
    validate_provider(&provider)?;
    match detect_backend() {
        Backend::Keyring => {
            let entry = keyring_entry(&provider)?;
            entry
                .set_password(&blob)
                .map_err(|e| format!("No se pudo guardar en keyring: {e}"))
        }
        Backend::EncryptedFile => {
            let mut map = read_fallback_map().unwrap_or_default();
            map.insert(provider, blob);
            write_fallback_map(&map)
        }
    }
}

#[tauri::command]
pub async fn load_secret(provider: String) -> Result<Option<String>, String> {
    load_secret_internal(&provider)
}

#[tauri::command]
pub async fn delete_secret(provider: String) -> Result<(), String> {
    validate_provider(&provider)?;
    match detect_backend() {
        Backend::Keyring => {
            let entry = keyring_entry(&provider)?;
            match entry.delete_credential() {
                Ok(()) | Err(KeyringError::NoEntry) => Ok(()),
                Err(e) => Err(format!("No se pudo borrar del keyring: {e}")),
            }
        }
        Backend::EncryptedFile => {
            let mut map = read_fallback_map().unwrap_or_default();
            map.remove(&provider);
            if map.is_empty() {
                let path = fallback_path()?;
                if path.exists() {
                    let _ = fs::remove_file(path);
                }
                Ok(())
            } else {
                write_fallback_map(&map)
            }
        }
    }
}

#[tauri::command]
pub fn secrets_backend_info() -> SecretsBackendInfo {
    let backend = detect_backend();
    let fallback_reason = BACKEND_INIT_REASON.get().and_then(|r| r.clone());
    match backend {
        Backend::Keyring => SecretsBackendInfo {
            backend: "keyring",
            available: true,
            fallback_reason: None,
        },
        Backend::EncryptedFile => SecretsBackendInfo {
            backend: "encrypted_file",
            available: current_passphrase().is_ok(),
            fallback_reason,
        },
    }
}

#[tauri::command]
pub fn set_fallback_passphrase(passphrase: String) -> Result<(), String> {
    if passphrase.is_empty() {
        return Err("La passphrase no puede estar vacía".to_string());
    }
    let mut guard = fallback_state()
        .lock()
        .map_err(|_| "No se pudo bloquear el estado del fallback".to_string())?;
    guard.passphrase = Some(Zeroizing::new(passphrase));
    Ok(())
}

#[tauri::command]
pub fn clear_fallback_passphrase() -> Result<(), String> {
    let mut guard = fallback_state()
        .lock()
        .map_err(|_| "No se pudo bloquear el estado del fallback".to_string())?;
    guard.passphrase = None;
    Ok(())
}

