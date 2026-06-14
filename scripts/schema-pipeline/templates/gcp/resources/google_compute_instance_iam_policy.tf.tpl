# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance_iam_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance_iam_policy" "this" {

  instance_name = ""     # string | required
  policy_data   = ""     # string | required
  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed
  zone          = ""     # string | optional+computed

  # etag          = ""     # string | computed

}

