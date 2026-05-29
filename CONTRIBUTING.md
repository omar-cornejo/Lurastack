# Contributing to LuraStack

Thanks for considering a contribution. This document covers the day-to-day mechanics; the high-level architecture lives in [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

By participating you agree to abide by the [Code of Conduct](CODE_OF_CONDUCT.md).

## Reporting bugs

Open an issue at https://github.com/omar-cornejo/lurastack/issues with:

- What you did (steps to reproduce)
- What you expected
- What actually happened (with the relevant output from the embedded terminal or `npm run tauri dev` logs)
- OS, Node and Rust versions, and LuraStack git SHA

For UI bugs, a screenshot or short screen recording helps enormously.

## Proposing a feature

For anything non-trivial, open a discussion or a draft issue first. The goal is to align on scope before either of us spends real time. Tiny ergonomic fixes can go straight to a PR.

## Development setup

See [README.md → Quick start](README.md#quick-start) for prerequisites. The shortest loop is:

```bash
npm install
npm run tauri dev
```

`npm run dev` (without `tauri`) opens the web UI in a browser, which is faster for pure-frontend changes but loses Tauri filesystem / terraform integration.

### Project layout (developer-facing)

- `src/` — TypeScript / React. Most contributions land here.
- `src-tauri/src/` — Rust. Edit only if you need new commands exposed to the frontend or new subprocess behaviour.
- `src/schemas/` — Terraform resource schemas (JSON) plus HCL templates (`*.tf.tpl`). Adding a resource means adding both files; Vite picks them up via `import.meta.glob` at build time, no code edit needed.
- `public/templates/` — gallery templates. Each is `<provider>/<id>/{manifest.json, project.lura}`.
- `scripts/` — build-time helpers (icon import, template index generation).

## Coding conventions

**TypeScript**

- Strict mode is on. Don't relax it for new code.
- Prefer editing existing files; resist creating new abstractions until two or three call sites justify them.
- Comments only when the *why* is non-obvious. Identifiers should explain the *what*.
- No new ESLint or Prettier configs; follow the existing style.

**Rust**

- `cargo fmt` before pushing.
- `cargo clippy -- -D warnings` should pass.
- Tauri commands live in `src-tauri/src/`; keep them thin — push logic into helpers.

**HCL emission**

- The single source of truth for resource → HCL is `src/models/hclEmitter.ts`. Don't fork the logic; if you need different output, extend `terraformResourceToHCL`.
- Dotted-key attributes (`"default_action.type": "forward"`) become nested HCL blocks. Tests and templates rely on this convention.

## Commit messages

Use [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` new functionality
- `fix:` bug fix
- `docs:` documentation
- `chore:` tooling, deps, build
- `refactor:` no behaviour change
- `test:` tests only

Scope is optional (`feat(canvas): ...`).

## Pull request checklist

Before requesting review:

- [ ] `npx tsc --noEmit` passes
- [ ] `cd src-tauri && cargo check` passes (and `cargo clippy` if you touched Rust)
- [ ] App boots: `npm run tauri dev` doesn't error on start
- [ ] You manually exercised the change (describe how in the PR body)
- [ ] No secrets, credentials, or absolute paths in the diff
- [ ] If you added an external icon or asset, attribution in `NOTICE` or `public/icons/ATTRIBUTIONS.md`

PRs are squashed and merged. Write the PR title in the same Conventional Commits style as your final commit.

## Adding a new Terraform resource to the catalog

1. Drop `src/schemas/<provider>/resources/<resource_type>.json` (the schema in HashiCorp's `terraform providers schema -json` format).
2. Drop the matching `src/schemas/<provider>/templates/resources/<resource_type>.tf.tpl` (HCL skeleton).
3. If it has an obvious cloud-vendor icon, copy it to `public/icons/` and register it in `src/models/iconRegistry.ts`. Otherwise it falls back to the default icon.
4. Categorize it (Compute / Networking / etc.) by adding an entry to `src/models/categoryRegistry.ts`.

No code change is required for the resource to appear in the sidebar; the registry uses `import.meta.glob({ eager: true })`.

## Adding a new gallery template

Each template is a directory under `public/templates/<provider>/<id>/` with two files:

- `manifest.json` — `TemplateManifest` shape (see `src/types/templates.ts`).
- `project.lura` — a full `LuraProject` (see `src/types/project.ts`) with the desired resources, nodes and edges.

Then run `npm run templates:index` to rebuild `public/templates/index.json`. The pre-render hook in `src/commands/templateManager.ts` will write a valid `main.tf` to each view directory on instantiation so `terraform plan` works immediately.

## Questions

Open a discussion at https://github.com/omar-cornejo/lurastack/discussions or email omarcornejovargas@gmail.com.
