# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_scc_source_iam_policy                            │
# └──────────────────────────────────────────────────────────────┘
data "google_scc_source_iam_policy" "this" {

  organization = ""     # string | required
  source       = ""     # string | required
  id           = ""     # string | optional+computed

  # etag         = ""     # string | computed
  # policy_data  = ""     # string | computed

}

