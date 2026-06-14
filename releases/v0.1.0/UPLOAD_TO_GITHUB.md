# Uploading to GitHub Releases

Instructions to create the v0.1.0 release on GitHub using the `gh` CLI.

## Prerequisites

```bash
# Install GitHub CLI if not already installed
# https://cli.github.com/

# Verify you're authenticated
gh auth status
```

## Manual Upload (via GitHub Web UI)

1. Go to https://github.com/omar-cornejo/Lurastack/releases
2. Click **"Draft a new release"**
3. Select tag: **v0.1.0** (or create it)
4. Release title: **LuraStack v0.1.0 — First Public Release**
5. Copy content from `GITHUB_RELEASE_BODY.md` into the description
6. Upload files:
   - `LuraStack_0.1.0_amd64.AppImage`
   - `LuraStack_0.1.0_amd64.deb`
   - `LuraStack-0.1.0-1.x86_64.rpm`
   - `SHA256SUMS`
7. Click **"Publish release"**

## CLI Upload (if `gh` is available)

```bash
# Create release with files
gh release create v0.1.0 \
  LuraStack_0.1.0_amd64.AppImage \
  LuraStack_0.1.0_amd64.deb \
  LuraStack-0.1.0-1.x86_64.rpm \
  SHA256SUMS \
  --title "LuraStack v0.1.0 — First Public Release" \
  --notes-file GITHUB_RELEASE_BODY.md
```

## Post-Release Checklist

- [ ] Verify all files are visible on GitHub Releases page
- [ ] Test AppImage download and execute
- [ ] Test DEB installation on Ubuntu
- [ ] Test RPM installation on Fedora
- [ ] Verify SHA256 checksums match
- [ ] Update GitHub project README with download links
- [ ] Share release in Hacker News / relevant communities
- [ ] Create announcement post if needed

## File Verification After Upload

```bash
# Download files from release
gh release download v0.1.0

# Verify checksums
sha256sum -c SHA256SUMS
```

## Notes

- **Tag**: v0.1.0 already exists locally (commit f9b1324)
- **Current date**: 2026-06-14
- **Release type**: First public release (pre-1.0)
- **Platforms**: Linux only (x86_64)

See `RELEASE.md` for feature list and known limitations.
