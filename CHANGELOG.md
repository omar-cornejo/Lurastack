# Changelog

All notable changes to LuraStack are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While LuraStack is pre-1.0, minor releases may include breaking changes to the
`.lura` project format.

## [Unreleased]

### Added

- Resolution-aware UI scaling: the interface adapts its size to the display,
  staying identical on 1080p, compacting slightly on narrow laptops, and
  growing on high-resolution (4K/5K) monitors.

## [0.1.0] - 2026-06-07

First public release.

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
- **Automated test suite**: frontend unit tests (Vitest), backend tests
  (`cargo test`), and end-to-end browser tests (Playwright, mocked backend),
  all run in CI on every pull request.

[Unreleased]: https://github.com/omar-cornejo/Lurastack/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/omar-cornejo/Lurastack/releases/tag/v0.1.0
