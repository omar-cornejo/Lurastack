# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_snapshot_iam_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_snapshot_iam_policy" "this" {

  name        = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

