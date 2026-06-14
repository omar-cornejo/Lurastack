# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_scc_v2_organization_source_iam_member        │
# └──────────────────────────────────────────────────────────────┘
resource "google_scc_v2_organization_source_iam_member" "this" {

  member       = ""     # string | required
  organization = ""     # string | required
  role         = ""     # string | required
  source       = ""     # string | required
  id           = ""     # string | optional+computed

  # etag         = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

