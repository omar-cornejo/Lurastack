# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_artifact_registry_repository_iam_member      │
# └──────────────────────────────────────────────────────────────┘
resource "google_artifact_registry_repository_iam_member" "this" {

  member     = ""     # string | required
  repository = ""     # string | required
  role       = ""     # string | required
  id         = ""     # string | optional+computed
  location   = ""     # string | optional+computed
  project    = ""     # string | optional+computed

  # etag       = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

