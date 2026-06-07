# Contributing to LuraStack

Let's make LuraStack better, together!

This document covers the day-to-day mechanics of contributing. The high-level
architecture lives in [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

By participating you agree to abide by the [Code of Conduct](CODE_OF_CONDUCT.md).

## Where to start

Not sure what to work on? Look for issues labelled
[`good first issue`](https://github.com/omar-cornejo/lurastack/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)
— these are scoped to be approachable without deep knowledge of the codebase.
Adding a new Terraform resource or a new gallery template (described below) is
also a great entry point: it requires no code changes, just data files.

## Reporting bugs

Use the [Bug report template](https://github.com/omar-cornejo/lurastack/issues/new?template=bug_report.yml).
The template asks for steps to reproduce, expected vs. actual behaviour, OS and
version info, and any relevant logs from the embedded terminal or
`npm run tauri dev` console. For UI bugs, a screenshot or screen recording
helps enormously.

For **security vulnerabilities**, please follow the [Security Policy](SECURITY.md)
instead of opening a public issue.

## Proposing a feature

Use the [Feature request template](https://github.com/omar-cornejo/lurastack/issues/new?template=feature_request.yml).
For anything non-trivial, open a discussion or draft issue first so we can
align on scope before either of us invests real time. Tiny ergonomic fixes can
go straight to a PR.

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

## Testing

The project ships with an automated test suite, and **CI runs it on every pull
request** (see [`.github/workflows/ci.yml`](.github/workflows/ci.yml)). You don't
need to wait for CI — you can run exactly what it runs, locally:

```bash
# Frontend (TypeScript / React) — Vitest
npm test               # run the whole suite once
npm run test:watch     # watch mode while developing
npm run test:coverage  # same suite + a coverage report

# Backend (Rust) — built-in test harness
cd src-tauri && cargo test

# End-to-end (real browser, mocked backend) — Playwright
npm run test:e2e       # headless run
npm run test:e2e:ui    # interactive UI for debugging a flow
```

> The first `npm run test:e2e` downloads a Chromium build — run
> `npx playwright install --with-deps chromium` once if it isn't already cached.

If your PR passes `npm test` and `cargo test` locally, it will pass the blocking
test stages in CI. The full CI gate is: `tsc --noEmit`, `npm test` (with
coverage), `npm run build`, `cargo fmt --check`, `cargo clippy -- -D warnings`,
`cargo test`, dependency audit, and secret scanning. The Playwright E2E job also
runs but is **non-blocking for now** (browser tests are flakier than unit tests);
it will be promoted to a required check once it has proven stable.

**Where tests live**

- Frontend tests are **colocated** next to the source as `*.test.ts(x)` (e.g.
  `src/models/hclEmitter.test.ts`). The adjacent test is the best template to
  copy when you touch a module.
- Rust tests live in an in-file `#[cfg(test)] mod tests` at the bottom of each
  `.rs` file, so they can exercise private helpers directly.
- Cross-cutting fixture checks live under `src/__fixtures__/`.
- End-to-end specs live under `e2e/` (`*.spec.ts`). They run the app in a real
  Chromium against the Vite dev server with the Tauri backend **mocked** — see
  `e2e/fixtures/tauriMock.ts` (the IPC shim) and `e2e/fixtures/app.ts` (the
  create-project-and-open-canvas helper). No native build or real credentials
  are required.

**When you add or change behaviour, add or update the test next to it.** Pure
logic (parsing, emission, validation, geometry) is the priority and belongs in a
colocated unit test; if a useful piece of logic is trapped inside a big
component, prefer **extracting it to a module and testing it there** (verbatim,
no behaviour change) over reaching for the DOM. The whole-flow canvas/terminal
behaviours that genuinely need a browser (ReactFlow layout, the model→HCL round
trip on real nodes, undo/redo, the detached terminal window) are covered by the
Playwright E2E specs instead. Coverage is reported but **not gated** — don't let
a coverage number block a sensible change; the gate is simply "the tests pass".

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
- [ ] `npm test` passes (add or update tests for the behaviour you changed)
- [ ] `cd src-tauri && cargo check` passes — and if you touched Rust, also `cargo test`, `cargo clippy -- -D warnings`, and `cargo fmt`
- [ ] If you changed a canvas / terminal flow, `npm run test:e2e` still passes
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

The schema-loading pipeline is smoke-tested in `src/models/nodeRegistry.test.ts`,
and any resource used by a gallery template must have a schema in the catalog —
this is enforced by `src/__fixtures__/templates.fixture.test.ts`, so a template
referencing a type without a schema will fail CI.

## Adding a new gallery template

Each template is a directory under `public/templates/<provider>/<id>/` with two files:

- `manifest.json` — `TemplateManifest` shape (see `src/types/templates.ts`).
- `project.lura` — a full `LuraProject` (see `src/types/project.ts`) with the desired resources, nodes and edges.

Then run `npm run templates:index` to rebuild `public/templates/index.json`. The pre-render hook in `src/commands/templateManager.ts` will write a valid `main.tf` to each view directory on instantiation so `terraform plan` works immediately.

Every shipped template is validated by `src/__fixtures__/templates.fixture.test.ts`
(the index matches what's on disk, `project.lura` parses as a `LuraProject`, the
`resourceCount` is accurate, and every resource type has a catalog schema), and
each of its resources is run through the real HCL emitter by
`src/__fixtures__/emitterTemplate.fixture.test.ts`. Run `npm test` after adding a
template to catch these before CI does.

## Questions

Open a discussion at https://github.com/omar-cornejo/lurastack/discussions or email omarcornejovargas@gmail.com.
