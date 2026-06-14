# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_disk_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_disk_iam_policy" "this" {

  name        = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  zone        = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

