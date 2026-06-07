# LuraStack — Visual Infrastructure-as-Code Platform

> Drag-and-drop AWS / GCP architectures, get real Terraform you can `plan` and `apply` from the same window.

[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![CI](https://github.com/omar-cornejo/lurastack/actions/workflows/ci.yml/badge.svg)](https://github.com/omar-cornejo/lurastack/actions/workflows/ci.yml)
[![Tauri](https://img.shields.io/badge/Tauri-2-24C8DB.svg)](https://tauri.app/)
[![React](https://img.shields.io/badge/React-19-61DAFB.svg)](https://react.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-3178C6.svg)](https://www.typescriptlang.org/)
[![Rust](https://img.shields.io/badge/Rust-stable-CE412B.svg)](https://www.rust-lang.org/)

![LuraStack main UI](docs/screenshots/main-ui.png)

## What is LuraStack?

LuraStack is an open-source, local-first desktop app for designing cloud
infrastructure visually and deploying it through Terraform — without ever
leaving a single window.

You drag VPCs, subnets, EC2 instances, Lambdas, Pub/Sub topics, BigQuery
tables onto a canvas, and LuraStack generates a syntactically valid `main.tf`
you can immediately `terraform plan` or `terraform apply` against your account.
Edits flow in both directions: hand-written HCL is parsed back into the visual
canvas, so the diagram and the code never drift.

It runs entirely on your machine (Tauri + Rust + React), reads your usual
`~/.aws/credentials` or `gcloud` setup, and shells out to your local
`terraform` binary. No cloud account is required to try it; **nothing leaves
your laptop unless you choose to `apply`**.

---

## Table of contents

- [Features](#features)
- [Quick start](#quick-start)
- [Project structure](#project-structure)
- [Tech stack](#tech-stack)
- [Templates](#templates)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Security](#security)
- [License](#license)
- [Citation](#citation)

---

## Features

- **Visual canvas** with hierarchical containers (VPC → subnets → instances)
  and zone containers (security groups, availability zones).
- **Bidirectional HCL**: change the diagram → `main.tf` updates; edit the
  code → the canvas updates.
- **Multi-provider**: AWS and GCP catalogs (~30 resources each) loaded from
  the official Terraform provider schemas, with a category-grouped sidebar.
- **Templates gallery**: 8 ready-to-deploy architectures for AWS and GCP
  (basic VPC + VM, ALB + ASG + RDS, serverless Lambda stack, Pub/Sub
  pipeline, and more).
- **Four projection views** of the same project: Canvas, Code,
  Diff (plan output), Cloud (live state).
- **Embedded terminal** (xterm.js + portable-pty) — run any shell command in
  the project directory without leaving the app.
- **Project files on disk** stored as a `.lura` JSON snapshot plus `.tf`
  files. Open later, share with a colleague, or version-control it with Git.

## Quick start

### Prerequisites

| Requirement | Version |
|---|---|
| Node.js | ≥ 20.19.0 (see `.nvmrc`) |
| Rust toolchain | stable (via `rustup`) |
| Terraform CLI | ≥ 1.5 (only for `plan` / `apply`) |
| Tauri system deps | [platform-specific](https://v2.tauri.app/start/prerequisites/) |

### Run from source

```bash
git clone https://github.com/omar-cornejo/lurastack.git
cd lurastack
npm install
npm run tauri dev
```

Pick a template from the welcome screen, drop nodes on the canvas, and hit
**Plan** to see what Terraform would do.

### Run the tests

```bash
npm test                      # frontend unit tests (Vitest)
cd src-tauri && cargo test    # backend tests (Rust)
npm run test:e2e              # end-to-end flows in a real browser (Playwright)
```

The frontend and backend suites are deterministic and fast; the Playwright E2E
specs drive the real canvas and terminal flows in Chromium with the native
backend mocked, so they need no credentials or native build. CI runs all of
these — plus type-check, lint, build, and dependency/secret scans — on every
pull request (E2E is currently non-blocking). See
[CONTRIBUTING.md](CONTRIBUTING.md#testing) for the full workflow.

### Build a release binary

```bash
npm run tauri build
```

The platform-native bundle (`.AppImage`, `.dmg`, `.msi`) lands under
`src-tauri/target/release/bundle/`.

## Project structure

```
lurastack/
├── src/                    # React + TypeScript frontend
│   ├── components/         # Panels: Canvas, Code, Diff, Cloud, sidebar, inspector
│   ├── canvas/             # ReactFlow custom nodes and edges
│   ├── models/             # Domain model, HCL emitter, node/category registries
│   ├── commands/           # Glue between UI and Tauri backend commands
│   ├── schemas/            # Terraform resource schemas (JSON) + HCL templates (.tf.tpl)
│   └── types/              # Shared TypeScript types
├── src-tauri/              # Rust desktop runtime (Tauri commands, PTY, credentials)
├── e2e/                    # Playwright end-to-end specs + Tauri IPC mock fixtures
├── public/
│   ├── icons/              # AWS / GCP / Azure service icons
│   └── templates/          # Gallery templates (8 instantiable architectures)
├── scripts/                # Build-time helpers (icon import, template index)
└── docs/                   # Architecture overview, screenshots
```

## Tech stack

| Layer | Technology |
|---|---|
| Desktop shell | Tauri 2 (Rust core + system webview) |
| UI | React 19 + TypeScript 5 + Vite 7 |
| Canvas | ReactFlow 11 |
| Styling | Tailwind CSS 3 + CoreUI + Iconify |
| Terminal | xterm.js + portable-pty |
| Rust backend | hcl-rs, tokio, serde, anyhow, dirs, keyring-core |
| IaC | Terraform — invoked as subprocess, never bundled |

All dependencies are open source and pinned to exact versions. See
[NOTICE](NOTICE) for the full attribution list.

## Templates

The gallery ships with 8 instantiable architectures:

| Provider | Template | Resources |
|---|---|---|
| AWS | Basic VPC + VM | VPC, IGW, public subnet, route table, SG, EC2 |
| AWS | Classic web (ALB + ASG + RDS) | VPC, 4 subnets, ALB + listener + TG, Launch Template + ASG, Aurora |
| AWS | Serverless (Lambda + S3 + DynamoDB) | S3 bucket, DynamoDB, IAM, Lambda, S3 notification |
| AWS | Data pipeline (SQS → Lambda) | SQS, S3, DynamoDB, IAM, Lambda + event source mapping |
| GCP | Basic network + VM | Network, subnet, firewall, Compute Engine instance |
| GCP | Classic web (LB + MIG + Cloud SQL) | Network, subnet, FW, health check, instance template, MIG, backend service, URL map, Cloud SQL |
| GCP | Serverless (Cloud Functions + Storage + BigQuery) | 2 buckets, service account, BQ dataset + table, Cloud Function gen2 |
| GCP | Data pipeline (Pub/Sub → BigQuery) | Pub/Sub topic + subscription, buckets, BQ dataset + table, service account, Cloud Function |

## Roadmap

- [ ] Azure provider catalog and templates
- [ ] Cross-provider resource references
- [ ] LSP-aware HCL editor (autocomplete, hover docs)
- [ ] Richer Diff view (resource-level visual diff, not just text)
- [ ] MCP server so AI assistants can read / mutate the project

## Contributing

Bug reports, feature ideas, and pull requests are welcome. Before contributing,
please read:

- [CONTRIBUTING.md](CONTRIBUTING.md) — development setup, coding conventions,
  commit style, and PR checklist.
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) — community standards.

For non-trivial features, open a discussion or draft issue first so we can
align on scope before investing real time.

## Security

If you discover a security vulnerability, **please do not open a public GitHub
issue**. Instead, follow the [Security Policy](SECURITY.md) to report it
privately. We aim to acknowledge reports within 72 hours.

## License

LuraStack is licensed under the [Apache License 2.0](LICENSE).

Third-party attributions:
- Software dependencies → [NOTICE](NOTICE)
- Cloud provider icons → [public/icons/ATTRIBUTIONS.md](public/icons/ATTRIBUTIONS.md)

## Citation

If you use LuraStack in academic work, please cite the originating
Bachelor's thesis:

```bibtex
@thesis{cornejo2026lurastack,
  author = {Cornejo, Omar Antonio},
  title  = {LuraStack: A Visual Editor for Cloud Infrastructure as Code},
  school = {Universitat Politècnica de Catalunya, Facultat d'Informàtica de Barcelona},
  year   = {2026},
  type   = {Bachelor's Thesis}
}
```
