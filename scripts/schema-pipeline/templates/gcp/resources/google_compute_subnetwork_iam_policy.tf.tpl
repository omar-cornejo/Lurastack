# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_subnetwork_iam_policy                │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_subnetwork_iam_policy" "this" {

  policy_data = ""     # string | required
  subnetwork  = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

