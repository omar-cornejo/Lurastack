# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_notebooks_instance_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
data "google_notebooks_instance_iam_policy" "this" {

  instance_name = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed
  # policy_data   = ""     # string | computed

}

