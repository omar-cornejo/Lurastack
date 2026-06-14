# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_region_disk_iam_policy                   │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_region_disk_iam_policy" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

