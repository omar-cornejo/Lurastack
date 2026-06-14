# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_project_iam_policy                               │
# └──────────────────────────────────────────────────────────────┘
data "google_project_iam_policy" "this" {

  project     = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

