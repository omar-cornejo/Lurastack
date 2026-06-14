# Schema extraction pipeline

The Go tooling that turns a Terraform provider's machine-readable schema into the
per-resource catalog and HCL skeletons LuraStack ships. It is **not part of the
desktop app** and is not built or bundled with it — it is a developer/maintainer
tool, run by hand when a provider releases a new version, whose output is then
curated into the app's catalog under [`../../src/schemas/`](../../src/schemas/).

> This is why LuraStack's catalog isn't hand-written: every resource, every
> attribute, its type and whether it is required/optional/computed comes
> straight from the provider's own schema, so the catalog can't silently drift
> from what Terraform actually accepts. See the thesis for the full rationale.

## What's here

```
schema-pipeline/
├── extract_schemas.go   # split the raw provider schema into one JSON per resource
├── main.go              # generate an annotated HCL skeleton (.tf.tpl) per resource
├── audit_schemas.go     # coverage report over the split JSON schemas
├── go.mod / go.sum      # Go module + pinned dependencies
└── templates/           # generated HCL skeletons (committed as reference output)
    ├── aws/   { resources/ , data_sources/ }   # 1526 + 608 .tf.tpl
    └── gcp/   { resources/ , data_sources/ }   #  863 + 279 .tf.tpl
```

Each `.tf.tpl` is a ready-to-edit `resource`/`data` block with every argument
listed and annotated with its type and constraint, including deeply nested
blocks (the AWS provider nests up to ~14 levels). Example:

```hcl
resource "aws_dms_endpoint" "this" {
  endpoint_id   = ""     # string | required
  endpoint_type = ""     # string | required
  password      = ""     # string | optional+sensitive
  port          = 0      # number | optional
  ...
}
```

The `templates/` tree is the **full** provider surface (every resource and data
source the provider exposes), not just the ~30 per provider that the app's
gallery currently uses — it documents the real reach of the extraction.

## Each tool is its own program

The three `.go` files each declare `func main()`, so they are run individually
with `go run <file>.go …` (running `go build ./...` over the whole folder fails
with "main redeclared" — that's expected).

## Reproducing the pipeline

Prerequisites: Go ≥ 1.26 and the Terraform CLI.

```bash
# 0. From a directory whose main.tf declares the provider(s) you want,
#    dump the machine-readable schema:
terraform init
terraform providers schema -json > providers-schema.json

# 1. Split the monolithic schema into one JSON per resource/data source.
#    Optional second arg filters by provider substring (e.g. "aws", "google").
go run extract_schemas.go providers-schema.json aws
#    → writes json_schemas/<provider>/{resources,data_sources}/*.json

# 2. Generate the annotated HCL skeletons from the same schema.
go run main.go providers-schema.json aws
#    → writes output/{resources,data_sources}/*.tf.tpl
#    (the curated copy of these lives here under templates/<provider>/)

# 3. (optional) Audit coverage of the split schemas.
go run audit_schemas.go json_schemas
```

The intermediate `providers-schema.json` (multi-MB), the split `json_schemas/`
tree and Terraform's `.terraform/` cache are **generated artifacts** and are not
committed — only this code and the curated `templates/` output are.

## How this feeds the app

The generated skeletons are the starting point for the catalog the app loads
from [`../../src/schemas/`](../../src/schemas/): a resource's JSON schema and its
`.tf.tpl` are curated into that directory, where Vite picks them up at build
time. Adding a resource to the app needs no code change — see
[`../../CONTRIBUTING.md`](../../CONTRIBUTING.md#adding-a-new-terraform-resource).

## Licence

Same as the rest of the repository — [Apache 2.0](../../LICENSE).
