# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_snapshot_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_snapshot_iam_policy" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

