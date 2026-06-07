# Roadmap

This is a living document describing where LuraStack is heading. It is a
statement of intent, not a commitment to dates. Priorities will shift with
feedback — if something here matters to you, open a
[discussion](https://github.com/omar-cornejo/Lurastack/discussions) or thumbs-up
the related issue.

LuraStack is pre-1.0 and in active development. Expect rough edges and
occasional breaking changes to the `.lura` project format until 1.0.

## Near term

- [ ] **Azure provider catalog and templates** — bring Azure to parity with the
      existing AWS and GCP catalogs (schemas + gallery templates).
- [ ] **Cross-provider resource references** — reference an attribute of a
      resource in one provider from a resource in another.
- [ ] **Screenshots and a short demo recording** in the README so the visual
      workflow is obvious at a glance.
- [ ] **Signed / notarized release binaries** for macOS and Windows (the
      release workflow exists; signing secrets are not yet wired up).

## Medium term

- [ ] **LSP-aware HCL editor** — autocomplete, hover docs, and inline
      diagnostics in the code view, backed by `terraform-ls`.
- [ ] **Richer Diff view** — a resource-level visual diff of `terraform plan`
      output, not just the raw text.
- [ ] **More gallery templates** — community-contributed reference
      architectures, with a clear contribution path (see
      [CONTRIBUTING.md](CONTRIBUTING.md)).

## Longer term / exploratory

- [ ] **MCP server** so AI assistants can read and mutate a LuraStack project
      programmatically.
- [ ] **Module support** — import and visualize existing Terraform modules.
- [ ] **State drift visualization** — surface differences between the diagram,
      the code, and the real cloud state in the Cloud view.

## Out of scope (for now)

- Bundling or managing the `terraform` binary itself — LuraStack invokes the
  user's local install on purpose (see [SECURITY.md](SECURITY.md)).
- Acting as a Terraform Cloud / Enterprise replacement — LuraStack is a local,
  visual authoring tool, not a remote state/run backend.

## How to influence the roadmap

- 👍 React to issues you care about — it's the clearest signal of demand.
- 💬 Start a [discussion](https://github.com/omar-cornejo/Lurastack/discussions)
  for ideas that aren't yet concrete issues.
- 🛠️ Pick up a [`good first issue`](https://github.com/omar-cornejo/Lurastack/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)
  — adding a resource schema or a gallery template needs no code changes.
