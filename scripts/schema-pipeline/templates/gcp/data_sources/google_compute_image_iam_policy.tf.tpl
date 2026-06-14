# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_image_iam_policy                         │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_image_iam_policy" "this" {

  image       = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

