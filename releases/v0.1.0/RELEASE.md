# LuraStack v0.1.0 Release

**Release Date**: 2026-06-14  
**Status**: First Public Release

## Downloads

### Linux Binaries

| Format | File | Size | SHA256 |
|---|---|---|---|
| **AppImage** | `LuraStack_0.1.0_amd64.AppImage` | 77 MB | `45bc4a3d3e6040c8b0732382cb57a7ce5a855a3b1b5900d368d665cdc458c274` |
| **DEB** | `LuraStack_0.1.0_amd64.deb` | 4.9 MB | `64b8168dcb8c8382720ca1354f5342a10a32cf846441306bbadc6ab919ff4de5` |
| **RPM** | `LuraStack-0.1.0-1.x86_64.rpm` | 4.9 MB | `4c6e5d95e63db97249dc7931dcb1b356c5914f45ad1643ff8508cf04b2d9cdeb` |

## Installation

### AppImage (Recommended for first-time use)

```bash
chmod +x LuraStack_0.1.0_amd64.AppImage
./LuraStack_0.1.0_amd64.AppImage
```

No installation required; runs on any Linux with glibc 2.29+.

### Debian/Ubuntu

```bash
sudo dpkg -i LuraStack_0.1.0_amd64.deb
lurastack
```

### Fedora/RHEL/CentOS

```bash
sudo rpm -i LuraStack-0.1.0-1.x86_64.rpm
lurastack
```

### Verify integrity

```bash
sha256sum -c SHA256SUMS
```

## What's Included

✅ **Visual canvas** — Drag-and-drop AWS/GCP resources  
✅ **Bidirectional HCL** — Sync between diagram and code  
✅ **8 templates** — Ready-to-deploy architectures  
✅ **4 projection views** — Canvas, Code, Diff, Cloud  
✅ **Embedded terminal** — Run Terraform commands in-app  
✅ **Project persistence** — Save to disk, share with Git  
✅ **Credential handling** — Secure, OS-native secret storage  
✅ **Test suite** — 399 frontend + 62 backend + 7 E2E tests  

## System Requirements

- **OS**: Linux (x86_64)
- **glibc**: 2.29 or later (most modern distros)
- **Terraform**: 1.5+ (for `plan` / `apply`; optional)
- **RAM**: 2GB minimum, 4GB recommended
- **Disk**: ~200MB for the app + project files

## Getting Started

1. Download and run the binary
2. Choose a template (or start blank)
3. Drag resources onto the canvas
4. Review generated HCL in the Code view
5. Run `terraform plan` in the embedded terminal
6. Deploy with `terraform apply`

## Known Limitations

- **macOS/Windows binaries** not yet available (planned for next release)
- **Signed binaries** not yet available (planned for next release)
- **Azure provider** catalog coming soon (AWS + GCP available now)

## What's Next

- Azure provider catalog and templates
- Cross-provider resource references
- LSP-aware HCL editor with autocomplete
- Richer Diff view (resource-level visual diff)
- MCP server for AI-assisted workflows
- State drift visualization

See [ROADMAP.md](https://github.com/omar-cornejo/Lurastack/blob/main/ROADMAP.md) for details.

## Changelog

### Added in v0.1.0

- Visual canvas with hierarchical containers (VPC → subnets → instances)
- Bidirectional HCL: change diagram → code updates; edit code → canvas updates
- Multi-provider catalogs for AWS and GCP (~30 resources each)
- Templates gallery with 8 ready-to-deploy architectures
- Four projection views: Canvas, Code, Diff (plan), Cloud (live state)
- Embedded terminal with xterm.js + portable-pty
- On-disk projects (`.lura` JSON + `.tf` files)
- Credential handling via OS-native secret stores with AEAD fallback
- Security model: CSP, per-folder FS grants, deny-list
- Automated test suite (Vitest, cargo test, Playwright)

## Support

- 🐛 **Bug reports**: [Open an issue](https://github.com/omar-cornejo/Lurastack/issues)
- 💬 **Questions**: [Start a discussion](https://github.com/omar-cornejo/Lurastack/discussions)
- 📖 **Documentation**: [README.md](https://github.com/omar-cornejo/Lurastack/blob/main/README.md)

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

**Thank you for downloading LuraStack!** We'd love your feedback.
