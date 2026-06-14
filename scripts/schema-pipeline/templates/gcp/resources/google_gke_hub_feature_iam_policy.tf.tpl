# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_feature_iam_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_feature_iam_policy" "this" {

  name        = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

