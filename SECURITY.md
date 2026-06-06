# Security Policy

LuraStack handles sensitive material — cloud provider credentials — and shells
out to a binary (`terraform`) that can create and destroy real infrastructure.
Security is therefore treated as a cross-cutting concern, not an afterthought.
We appreciate the work of security researchers and welcome responsible
disclosure of any vulnerability you find.

## Supported versions

LuraStack is in active development (pre-1.0). Security fixes are applied to the
latest release and the `main` branch only.

| Version            | Supported          |
| ------------------ | ------------------ |
| `main` (unreleased)| :white_check_mark: |
| Latest `0.x` release | :white_check_mark: |
| Older `0.x` releases | :x:              |

## Reporting a vulnerability

**Please do not report security vulnerabilities through public GitHub issues,
discussions, or pull requests.**

Instead, use one of these private channels:

1. **GitHub Security Advisories** (preferred) — open a private report at
   <https://github.com/omar-cornejo/lurastack/security/advisories/new>.
2. **Email** — send the details to **omarcornejovargas@gmail.com** with the
   subject line `[LuraStack Security]`.

To help us triage quickly, please include as much of the following as you can:

- The type of issue (e.g. credential leak, command injection, path traversal,
  cross-site scripting, malicious dependency).
- The component and file path(s) involved, and the affected version or commit.
- Step-by-step instructions to reproduce, including any special configuration.
- Proof-of-concept code, if available.
- The impact: what an attacker could achieve by exploiting it.

## Disclosure process

- We aim to **acknowledge** your report within **72 hours**.
- We aim to provide an **initial assessment** within **7 days**.
- Once a fix is ready, we will coordinate a disclosure date with you and credit
  you in the release notes and advisory (unless you prefer to remain anonymous).

We ask that you give us a reasonable window to address the issue before any
public disclosure.

## Scope and design notes

A few properties of the design are relevant when assessing reports:

- **Credentials are never written to disk in plaintext.** They are stored in the
  OS-native secret store (Secret Service / Keychain / Credential Manager) or, as
  a fallback, in an AEAD-encrypted file derived from a user passphrase, and they
  are zeroized from memory once no longer needed.
- **Terraform is never bundled.** LuraStack invokes the user's local `terraform`
  binary as a subprocess, always with a fixed binary path and an argument list
  (never through a shell), which removes command-injection by construction.
- **The frontend has no direct disk or process access.** All sensitive
  operations are confined to the Rust backend and exposed through a narrow,
  audited command surface, with a strict Content-Security-Policy on the webview.
- **Filesystem access is granted per folder, on demand.** The app does not hold
  a broad standing grant over the user's home directory. A project folder is
  granted (recursively) only when the user explicitly opens or creates it
  through the native dialog; the grant is validated (relative paths, `..`
  traversal, and system locations such as `/dev`, `/proc`, `/etc` are rejected)
  and persisted so it survives restarts. A **deny-list always wins** over any
  grant, keeping sensitive paths (`~/.ssh`, `~/.aws/credentials`, `~/.gnupg`,
  `~/.kube`, `~/.docker`, …) out of reach even if a parent folder is granted.
  The relevant logic lives in `src-tauri/src/project_access.rs`.

The security-sensitive helpers — path validation, the deny-list behaviour,
credential/INI parsing, and `.tf` filename sanitization — are covered by unit
tests (`src-tauri/src/*.rs` `#[cfg(test)]` modules), and `cargo test`,
`cargo clippy -- -D warnings`, a Rust/npm dependency audit, and secret scanning
all run in CI on every pull request.

For a deeper description of the threat model and mitigations, see the
architecture and security documentation in `docs/`.

## Out of scope

- Vulnerabilities in Terraform itself or in cloud provider APIs (report those to
  the respective vendors).
- Issues that require a fully compromised host or physical access to the user's
  machine.
- Findings from automated scanners without a demonstrable, realistic impact.

Thank you for helping keep LuraStack and its users safe.
