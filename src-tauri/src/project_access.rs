//! Dynamic filesystem scope for project folders.
//!
//! The static `fs:scope` in the capability file can't know in advance where a
//! user will keep their projects (any disk, any path, including hidden dirs
//! like `.lurastack-history`). Instead of granting broad `$HOME/**` access, we
//! grant access to a project folder *only* when the user explicitly opens or
//! creates it through the native dialog, and we re-grant those folders on the
//! next launch so the permission survives restarts.
//!
//! The `deny` list in the capability file still wins over anything granted
//! here, so sensitive paths (`~/.ssh`, AWS credentials, …) stay blocked even if
//! a parent folder is granted.

use std::collections::BTreeSet;
use std::fs;
use std::path::{Component, Path, PathBuf};
use std::sync::Mutex;

use serde::{Deserialize, Serialize};
use tauri::{AppHandle, Runtime};

const SERVICE: &str = "com.omarantoniocornejo.lurastack";
const GRANTS_FILE: &str = "project-access.json";

/// Absolute path prefixes that must never be granted, regardless of what the
/// dialog returns. These are system locations a Terraform project has no
/// legitimate reason to live in; granting them would be a footgun even though
/// the dialog makes selecting them unlikely.
// `validate_path` canonicalizes before comparing, which resolves symlinks. On
// `/usr`-merged distros `/bin`, `/sbin`, `/lib`, `/lib64` are symlinks into
// `/usr/*`, so the canonical form must be forbidden too — otherwise a grant on
// `/bin` would slip through as `/usr/bin`.
#[cfg(unix)]
const FORBIDDEN_PREFIXES: &[&str] = &[
    "/dev",
    "/proc",
    "/sys",
    "/etc",
    "/bin",
    "/sbin",
    "/lib",
    "/lib64",
    "/boot",
    "/run",
    "/var/run",
    "/usr/bin",
    "/usr/sbin",
    "/usr/lib",
    "/usr/lib64",
];
#[cfg(windows)]
const FORBIDDEN_PREFIXES: &[&str] = &[
    "C:\\Windows",
    "C:\\Program Files",
    "C:\\Program Files (x86)",
];

#[derive(Default, Serialize, Deserialize)]
struct GrantStore {
    paths: BTreeSet<String>,
}

static GRANTS: Mutex<Option<GrantStore>> = Mutex::new(None);

fn grants_file() -> Result<PathBuf, String> {
    let base = dirs::data_local_dir()
        .ok_or_else(|| "No se pudo determinar el directorio de datos local".to_string())?;
    let dir = base.join(SERVICE);
    fs::create_dir_all(&dir)
        .map_err(|e| format!("No se pudo crear el directorio de datos: {e}"))?;
    Ok(dir.join(GRANTS_FILE))
}

fn load_grants() -> GrantStore {
    let Ok(path) = grants_file() else {
        return GrantStore::default();
    };
    match fs::read_to_string(&path) {
        Ok(raw) => serde_json::from_str(&raw).unwrap_or_default(),
        Err(_) => GrantStore::default(),
    }
}

fn save_grants(store: &GrantStore) -> Result<(), String> {
    let path = grants_file()?;
    let serialized = serde_json::to_string_pretty(store)
        .map_err(|e| format!("No se pudo serializar los permisos: {e}"))?;
    fs::write(&path, serialized).map_err(|e| format!("No se pudo guardar los permisos: {e}"))
}

/// Normalize and validate a path before it is granted. Rejects relative paths,
/// `..` traversal, and system locations. Returns the cleaned absolute path.
fn validate_path(raw: &str) -> Result<PathBuf, String> {
    let path = Path::new(raw);
    if !path.is_absolute() {
        return Err(format!("La ruta del proyecto debe ser absoluta: {raw}"));
    }
    // Reject any `..` component so a granted folder can't be widened via traversal.
    if path.components().any(|c| matches!(c, Component::ParentDir)) {
        return Err(format!(
            "La ruta del proyecto no puede contener '..': {raw}"
        ));
    }

    // Compare against the real path when it exists (resolves symlinks); fall
    // back to the literal path for not-yet-created project folders.
    let resolved = fs::canonicalize(path).unwrap_or_else(|_| path.to_path_buf());

    let resolved_str = resolved.to_string_lossy();
    if resolved == Path::new("/") {
        return Err("No se puede conceder acceso a la raíz del sistema".to_string());
    }
    for prefix in FORBIDDEN_PREFIXES {
        let p = Path::new(prefix);
        if resolved == p || resolved.starts_with(p) {
            return Err(format!("Ruta del sistema no permitida: {resolved_str}"));
        }
    }
    Ok(resolved)
}

fn apply_to_scope<R: Runtime>(app: &AppHandle<R>, path: &Path) -> Result<(), String> {
    use tauri_plugin_fs::FsExt;
    app.fs_scope()
        .allow_directory(path, true)
        .map_err(|e| format!("No se pudo conceder acceso a la carpeta: {e}"))
}

/// Grant read/write access to a project folder chosen by the user, and persist
/// it so the grant is reapplied on the next launch.
#[tauri::command]
pub fn grant_project_access<R: Runtime>(app: AppHandle<R>, path: String) -> Result<(), String> {
    let resolved = validate_path(&path)?;
    apply_to_scope(&app, &resolved)?;

    let mut guard = GRANTS
        .lock()
        .map_err(|_| "No se pudo bloquear el estado de permisos".to_string())?;
    let store = guard.get_or_insert_with(load_grants);
    let key = resolved.to_string_lossy().to_string();
    if store.paths.insert(key) {
        save_grants(store)?;
    }
    Ok(())
}

/// Reapply every persisted grant. Call once from `setup()`. Grants that fail
/// validation (e.g. a folder that has since moved under a forbidden path) are
/// silently skipped so one bad entry can't block startup.
pub fn restore_grants<R: Runtime>(app: &AppHandle<R>) {
    let store = load_grants();
    for raw in &store.paths {
        if let Ok(resolved) = validate_path(raw) {
            let _ = apply_to_scope(app, &resolved);
        }
    }
    if let Ok(mut guard) = GRANTS.lock() {
        *guard = Some(store);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rejects_relative_paths() {
        assert!(validate_path("relative/path").is_err());
        assert!(validate_path("./project").is_err());
        assert!(validate_path("project").is_err());
    }

    #[test]
    fn rejects_parent_dir_traversal() {
        // `..` anywhere in the path must be rejected so a granted folder can't
        // be widened via traversal.
        assert!(validate_path("/home/user/../../../etc").is_err());
        assert!(validate_path("/home/user/projects/../secret").is_err());
    }

    #[cfg(unix)]
    #[test]
    fn rejects_system_root() {
        assert!(validate_path("/").is_err());
    }

    #[cfg(unix)]
    #[test]
    fn rejects_forbidden_system_prefixes() {
        // Every prefix in FORBIDDEN_PREFIXES, plus a path nested under one.
        for prefix in FORBIDDEN_PREFIXES {
            assert!(
                validate_path(prefix).is_err(),
                "expected {prefix} to be rejected",
            );
        }
        assert!(validate_path("/etc/ssh/sshd_config").is_err());
        assert!(validate_path("/proc/1/status").is_err());
    }

    #[cfg(unix)]
    #[test]
    fn accepts_a_normal_absolute_project_path() {
        // A path that does not exist still validates (falls back to the literal
        // path) as long as it is absolute, traversal-free and outside the
        // forbidden prefixes.
        let result = validate_path("/home/someone/projects/my-stack");
        assert!(result.is_ok(), "expected acceptance, got {result:?}");
    }

    #[cfg(unix)]
    #[test]
    fn does_not_treat_etcetera_lookalike_as_forbidden() {
        // `/etcetera` starts with the same bytes as `/etc` but is a different
        // path component — starts_with on Path compares whole components, so it
        // must be accepted.
        assert!(validate_path("/etcetera/projects").is_ok());
    }
}
