# Changelog

All notable changes to LuraStack are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While LuraStack is pre-1.0, minor releases may include breaking changes to the
`.lura` project format.

## [Unreleased]

## [0.1.0] - 2026-06-14

First public release, with native installers for Linux (`.AppImage`, `.deb`,
`.rpm`), macOS (`.dmg`, Intel and Apple Silicon) and Windows (`.msi`, `.exe`).

### Added

- **Visual canvas** with hierarchical containers (VPC → subnets → instances)
  and zone containers (security groups, availability zones).
- **Bidirectional HCL**: editing the diagram updates `main.tf`, and editing the
  code updates the canvas.
- **Multi-provider catalogs** for AWS and GCP (~30 resources each), loaded from
  the official Terraform provider schemas, with a category-grouped sidebar.
- **Templates gallery** of ready-to-deploy reference architectures for AWS and
  GCP (basic VPC + VM, ALB + ASG + RDS, a serverless Lambda stack, a Pub/Sub
  pipeline, and more).
- **Four projection views** of the same project: Canvas, Code, Diff (plan
  output), and Cloud (live state).
- **Embedded terminal** (xterm.js + portable-pty) for running shell commands in
  the project directory, with a detachable terminal window.
- **On-disk projects** stored as a `.lura` JSON snapshot alongside generated
  `.tf` files, suitable for sharing and version control.
- **Credential handling** via the OS-native secret store (Secret Service /
  Keychain / Credential Manager), with an AEAD-encrypted file fallback; secrets
  are zeroized from memory after use.
- **Security model**: strict Content-Security-Policy on the webview, per-folder
  filesystem grants validated on demand, and a deny-list that always wins over
  any grant (`~/.ssh`, `~/.aws/credentials`, `~/.gnupg`, `~/.kube`, …).
- **HCL validation** on demand via `terraform validate`, surfaced in the logs
  panel in the active UI language.
- **Resolution-aware UI scaling**: the interface adapts its size to the display,
  staying identical on 1080p, compacting slightly on narrow laptops, and
  growing on high-resolution (4K/5K) monitors.
- **Automated test suite**: frontend unit tests (Vitest), backend tests
  (`cargo test`), and end-to-end browser tests (Playwright, mocked backend),
  all run in CI on every pull request.

### Fixed

- Fonts and inline icons are now bundled and served locally instead of from a
  CDN, so they render correctly in the packaged app with no network access
  (previously the missing web font caused faux-bold "double-printed" text).
- The detached terminal window now receives live `plan` / `apply` / `destroy`
  output and fills its window, fixing both the missing output and the wasted
  empty area at the bottom.
- Provider and resource icons no longer overflow their containers (switched from
  cropping to contained scaling).

[Unreleased]: https://github.com/omar-cornejo/Lurastack/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/omar-cornejo/Lurastack/releases/tag/v0.1.0
