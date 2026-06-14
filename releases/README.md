# LuraStack Releases

Official release binaries and documentation for LuraStack.

## Latest Release

**[v0.1.0](v0.1.0/)** — First Public Release (2026-06-14)

- 3 Linux packages: AppImage, DEB, RPM
- SHA256 checksums for integrity verification
- Full installation and changelog documentation

## Directory Structure

```
releases/
├── v0.1.0/
│   ├── LuraStack_0.1.0_amd64.AppImage    (77 MB — universal Linux)
│   ├── LuraStack_0.1.0_amd64.deb         (4.8 MB — Debian/Ubuntu)
│   ├── LuraStack-0.1.0-1.x86_64.rpm      (4.8 MB — Fedora/RHEL/CentOS)
│   ├── SHA256SUMS                        (integrity checksums)
│   ├── RELEASE.md                        (installation & features)
│   └── GITHUB_RELEASE_BODY.md            (GitHub release notes)
└── README.md                             (this file)
```

## Quick Start

### Download Latest

- **AppImage** (recommended): [`LuraStack_0.1.0_amd64.AppImage`](v0.1.0/LuraStack_0.1.0_amd64.AppImage)
- **DEB**: [`LuraStack_0.1.0_amd64.deb`](v0.1.0/LuraStack_0.1.0_amd64.deb)
- **RPM**: [`LuraStack-0.1.0-1.x86_64.rpm`](v0.1.0/LuraStack-0.1.0-1.x86_64.rpm)

### Install

**AppImage**:
```bash
chmod +x LuraStack_0.1.0_amd64.AppImage
./LuraStack_0.1.0_amd64.AppImage
```

**Debian/Ubuntu**:
```bash
sudo dpkg -i LuraStack_0.1.0_amd64.deb
lurastack
```

**Fedora/RHEL/CentOS**:
```bash
sudo rpm -i LuraStack-0.1.0-1.x86_64.rpm
lurastack
```

## Verification

Verify the integrity of downloaded files:

```bash
# Download SHA256SUMS file
wget https://github.com/omar-cornejo/Lurastack/releases/download/v0.1.0/SHA256SUMS

# Verify all files
sha256sum -c SHA256SUMS
```

Expected output:
```
LuraStack_0.1.0_amd64.AppImage: OK
LuraStack_0.1.0_amd64.deb: OK
LuraStack-0.1.0-1.x86_64.rpm: OK
```

## Release Notes

See [RELEASE.md](v0.1.0/RELEASE.md) for:
- Detailed feature list
- Installation instructions
- System requirements
- Known limitations
- Roadmap

## Build from Source

To build your own binaries:

```bash
git clone https://github.com/omar-cornejo/Lurastack.git
cd Lurastack
npm install
npm run tauri build
```

Binaries will be in `src-tauri/target/release/bundle/`.

## Roadmap

**v0.2.0** (planned):
- Azure provider catalog
- Signed/notarized macOS & Windows binaries
- Cross-provider resource references

See [ROADMAP.md](../ROADMAP.md) for the full picture.

## Support

- 🐛 [Report issues](https://github.com/omar-cornejo/Lurastack/issues)
- 💬 [Ask questions](https://github.com/omar-cornejo/Lurastack/discussions)
- 📖 [Read documentation](../README.md)

## License

[Apache License 2.0](../LICENSE)
