# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_disk_iam_policy                          │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_disk_iam_policy" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  zone        = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

