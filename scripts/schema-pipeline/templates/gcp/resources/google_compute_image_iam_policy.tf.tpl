# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_image_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_image_iam_policy" "this" {

  image       = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

