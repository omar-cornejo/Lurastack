# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_instance_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_instance_iam_policy" "this" {

  instance_name = ""     # string | required
  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed
  zone          = ""     # string | optional+computed

  # etag          = ""     # string | computed
  # policy_data   = ""     # string | computed

}

