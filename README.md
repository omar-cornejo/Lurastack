# DDF — Visual Terraform Editor

> Drag-and-drop AWS / GCP architectures, get real Terraform you can `plan` and `apply` from the same window.

[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![Tauri](https://img.shields.io/badge/Tauri-2-24C8DB.svg)](https://tauri.app/)
[![React](https://img.shields.io/badge/React-19-61DAFB.svg)](https://react.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-3178C6.svg)](https://www.typescriptlang.org/)

![DDF main UI](docs/screenshots/main-ui.png)

## What is DDF?

DDF is a desktop application that lets you design cloud infrastructure visually and emits real Terraform HCL in real time. You drag VPCs, subnets, EC2 instances, Lambdas, Pub/Sub topics, BigQuery tables — and DDF generates a syntactically valid `main.tf` you can immediately `terraform plan` or `terraform apply` against your account. Edits flow in both directions: hand-written HCL is parsed back into the visual canvas, so the diagram and the code never drift.

It runs entirely on your machine (Tauri + Rust + React), reads your usual `~/.aws/credentials` or `gcloud` setup, and shells out to your local `terraform` binary. No cloud account is required to try it; nothing leaves your laptop unless you choose to `apply`.

## Features

- **Visual canvas** with hierarchical containers (VPC contains subnets, subnets contain instances) and zone containers (security groups, AZs).
- **Bidirectional HCL**: change the diagram → `main.tf` updates; edit the code → the canvas updates.
- **Multi-provider**: AWS and GCP catalogs (~30 resources each) loaded from the official Terraform provider schemas, with category-grouped sidebar.
- **Templates gallery**: 8 ready-to-deploy architectures (basic VPC + VM, classic ALB + ASG + RDS, serverless Lambda + S3 + DynamoDB, etc.) for AWS and GCP.
- **Four projection views** of the same project: Canvas, Code, Diff (plan output), Cloud (state).
- **Embedded terminal** (xterm.js + portable-pty) — run any shell command in the project directory without leaving the app.
- **Project history** stored as a `.ddf` JSON snapshot plus `.tf` files on disk. Open it later, share it, version-control it.

## Quick start

### Prerequisites

- **Node.js** 20 or newer
- **Rust** toolchain (`rustup` recommended) — required to build Tauri
- **Terraform CLI** ≥ 1.5 (only when you want to actually `plan` / `apply`)
- Platform-specific Tauri prerequisites: see [https://v2.tauri.app/start/prerequisites/](https://v2.tauri.app/start/prerequisites/)

### Run from source

```bash
git clone https://github.com/omar-cornejo/ddfib.git
cd ddfib
npm install
npm run tauri dev
```

That's it. Pick a template from the welcome screen, drop nodes on the canvas, hit "Plan" to see what Terraform would do.

### Build a release binary

```bash
npm run tauri build
```

The platform-native bundle (`.AppImage`, `.dmg`, `.msi`) lands under `src-tauri/target/release/bundle/`.

## Project structure

```
ddfib/
├── src/                    # React + TypeScript frontend
│   ├── components/         # Panels (Canvas, Code, Diff, Cloud, sidebar, inspector)
│   ├── canvas/             # ReactFlow custom nodes and edges
│   ├── models/             # Domain model (TerraformResource, schemas, HCL emitter)
│   ├── commands/           # Glue between UI and Tauri backend
│   ├── schemas/            # Terraform resource schemas (JSON) + HCL templates
│   └── types/              # Shared TS types
├── src-tauri/              # Rust desktop runtime
│   └── src/                # Terraform actions, AWS credential discovery, PTY
├── public/
│   ├── icons/              # AWS / GCP service icons
│   └── templates/          # Gallery templates (8 architectures)
├── scripts/                # Build-time helpers (icon import, template index)
└── docs/                   # Architecture overview, screenshots
```

## Tech stack

- **Tauri 2** — desktop shell (Rust core + system webview)
- **React 19** + **TypeScript 5** + **Vite 7** — UI
- **ReactFlow 11** — canvas and node graph
- **Tailwind CSS 3** + **CoreUI** + **Iconify** — styling
- **xterm.js** + **portable-pty** — embedded terminal
- **hcl-rs**, **tokio**, **serde** — Rust backend dependencies
- **Terraform** — invoked as a subprocess; never bundled

## Templates

The gallery ships with 8 instantiable architectures:

| Provider | Template | What it includes |
|---|---|---|
| AWS | Basic VPC + VM | VPC, IGW, public subnet, RT, SG, EC2 |
| AWS | Classic web (ALB + ASG + RDS) | VPC, 4 subnets, ALB + listener + TG, Launch Template + ASG, Aurora |
| AWS | Serverless (Lambda + S3 + DynamoDB) | S3 bucket, DynamoDB, IAM, Lambda, notification |
| AWS | Data pipeline (SQS → Lambda) | SQS, S3, DynamoDB, IAM, Lambda + event source mapping |
| GCP | Basic network + VM | Network, subnet, firewall, Compute instance |
| GCP | Classic web (LB + MIG + Cloud SQL) | Network, subnet, FW, health check, instance template, MIG, backend service, URL map, address, Cloud SQL |
| GCP | Serverless (Cloud Functions + Storage + BigQuery) | 2 buckets, service account, BQ dataset + table, Cloud Function gen2 |
| GCP | Data pipeline (Pub/Sub → BigQuery) | Pub/Sub topic + subscription, buckets, BQ dataset + table, service account, Cloud Function |

## Roadmap

- Azure provider catalog and templates
- Cross-provider resource references
- LSP-aware HCL editor (autocomplete, hover docs)
- Diff view richer than text (resource-level visual diff)
- MCP server so AI assistants can read / mutate the project

## Contributing

Bug reports, feature ideas, and pull requests are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for development setup and conventions, and please review the [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) before participating.

## License

DDF is licensed under the [Apache License 2.0](LICENSE). Third-party attributions are listed in [NOTICE](NOTICE) and [public/icons/ATTRIBUTIONS.md](public/icons/ATTRIBUTIONS.md).

## Citation

If you use DDF in academic work, please cite the originating Bachelor's thesis:

```bibtex
@thesis{cornejo2026ddf,
  author = {Cornejo, Omar},
  title  = {DDF: A Visual Editor for Cloud Infrastructure as Code},
  school = {Universitat Polit\`{e}cnica de Catalunya, Facultat d'Inform\`{a}tica de Barcelona},
  year   = {2026},
  type   = {Bachelor's Thesis}
}
```
