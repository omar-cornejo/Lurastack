# LuraStack v0.1.0 — First Public Release 🎉

Visual Infrastructure-as-Code design meets real Terraform deployment.

## Downloads

| Format | File | Size |
|---|---|---|
| **AppImage** | [`LuraStack_0.1.0_amd64.AppImage`](https://github.com/omar-cornejo/Lurastack/releases/download/v0.1.0/LuraStack_0.1.0_amd64.AppImage) | 77 MB |
| **DEB** | [`LuraStack_0.1.0_amd64.deb`](https://github.com/omar-cornejo/Lurastack/releases/download/v0.1.0/LuraStack_0.1.0_amd64.deb) | 4.8 MB |
| **RPM** | [`LuraStack-0.1.0-1.x86_64.rpm`](https://github.com/omar-cornejo/Lurastack/releases/download/v0.1.0/LuraStack-0.1.0-1.x86_64.rpm) | 4.8 MB |

## What's New

### Core Features
- **Visual canvas** with hierarchical containers and drag-and-drop resources
- **Bidirectional HCL** — diagram ↔ code syncs automatically, never drift
- **AWS & GCP catalogs** — ~30 resources each, loaded from official provider schemas
- **8 ready-to-deploy templates** for common architectures (web, serverless, data pipelines)
- **4 projection views**: Canvas, Code, Diff (terraform plan), Cloud (live state)
- **Embedded terminal** — run Terraform commands without leaving the app

### Security & Quality
- **Credential handling** via OS-native secret stores (keyring/Keychain/Credential Manager)
- **Strict CSP** + per-folder filesystem grants + deny-list for sensitive paths
- **399 frontend tests** (Vitest) + **62 backend tests** (cargo) + **7 E2E tests** (Playwright)
- **CI/CD on every commit** — linting, tests, build, security scans

### Platform
- Desktop app (Tauri 2 + Rust + React)
- Runs entirely on your machine — nothing leaves your laptop unless you choose to `apply`
- Projects stored as `.lura` JSON + `.tf` files for version control & sharing

## Installation

### Linux AppImage
```bash
chmod +x LuraStack_0.1.0_amd64.AppImage
./LuraStack_0.1.0_amd64.AppImage
```

### Debian/Ubuntu
```bash
sudo dpkg -i LuraStack_0.1.0_amd64.deb
lurastack
```

### Fedora/RHEL
```bash
sudo rpm -i LuraStack-0.1.0-1.x86_64.rpm
lurastack
```

### Build from Source
```bash
git clone https://github.com/omar-cornejo/Lurastack.git
cd Lurastack
npm install
npm run tauri build
```

## Getting Started

1. Launch LuraStack
2. Pick a template or start from scratch
3. Drag resources onto the canvas
4. View auto-generated `main.tf` in Code view
5. Run `terraform plan` in the embedded terminal
6. Deploy with `terraform apply`

**Everything runs locally.** No cloud accounts or credentials required to try it.

## Roadmap

**Coming soon:**
- Azure provider catalog
- Cross-provider resource references
- LSP-aware HCL editor with autocomplete
- Richer Diff view (resource-level visual diff)
- Signed/notarized macOS & Windows binaries

See [ROADMAP.md](https://github.com/omar-cornejo/Lurastack/blob/main/ROADMAP.md) for the full picture.

## Verify Integrity

```bash
sha256sum -c SHA256SUMS
```

SHA256 checksums:
```
45bc4a3d3e6040c8b0732382cb57a7ce5a855a3b1b5900d368d665cdc458c274  LuraStack_0.1.0_amd64.AppImage
64b8168dcb8c8382720ca1354f5342a10a32cf846441306bbadc6ab919ff4de5  LuraStack_0.1.0_amd64.deb
4c6e5d95e63db97249dc7931dcb1b356c5914f45ad1643ff8508cf04b2d9cdeb  LuraStack-0.1.0-1.x86_64.rpm
```

## Tech Stack

- **Desktop**: Tauri 2 (Rust core + system webview)
- **UI**: React 19 + TypeScript 5
- **Canvas**: ReactFlow 11
- **Terminal**: xterm.js + portable-pty
- **HCL**: hcl-rs
- **Testing**: Vitest, cargo test, Playwright

## System Requirements

- **OS**: Linux (x86_64), 2.29+ glibc
- **RAM**: 2GB minimum, 4GB recommended
- **Terraform**: 1.5+ (optional, for deploy)

## Citation

```bibtex
@thesis{cornejo2026lurastack,
  author = {Cornejo, Omar Antonio},
  title  = {LuraStack: A Visual Editor for Cloud Infrastructure as Code},
  school = {Universitat Politècnica de Catalunya, Facultat d'Informàtica de Barcelona},
  year   = {2026},
  type   = {Bachelor's Thesis}
}
```

## License

[Apache License 2.0](https://github.com/omar-cornejo/Lurastack/blob/main/LICENSE)

---

**Questions?** Open an [issue](https://github.com/omar-cornejo/Lurastack/issues) or [discussion](https://github.com/omar-cornejo/Lurastack/discussions).

**Help us improve!** We'd love to hear your feedback and ideas.
