# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_gke_hub_scope_iam_policy                         │
# └──────────────────────────────────────────────────────────────┘
data "google_gke_hub_scope_iam_policy" "this" {

  scope_id    = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

