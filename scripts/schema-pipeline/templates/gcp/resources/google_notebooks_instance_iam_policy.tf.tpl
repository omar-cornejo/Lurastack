# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_notebooks_instance_iam_policy                │
# └──────────────────────────────────────────────────────────────┘
resource "google_notebooks_instance_iam_policy" "this" {

  instance_name = ""     # string | required
  policy_data   = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed

}

