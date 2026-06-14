# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_scope_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_scope_iam_policy" "this" {

  policy_data = ""     # string | required
  scope_id    = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

