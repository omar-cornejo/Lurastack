# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_project_iam_policy                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_project_iam_policy" "this" {

  policy_data = ""     # string | required
  project     = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

