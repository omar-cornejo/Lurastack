# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_scc_v2_organization_source_iam_policy        │
# └──────────────────────────────────────────────────────────────┘
resource "google_scc_v2_organization_source_iam_policy" "this" {

  organization = ""     # string | required
  policy_data  = ""     # string | required
  source       = ""     # string | required
  id           = ""     # string | optional+computed

  # etag         = ""     # string | computed

}

