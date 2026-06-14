# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_subnetwork_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_subnetwork_iam_policy" "this" {

  subnetwork  = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

