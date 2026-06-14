# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_notebooks_runtime_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
data "google_notebooks_runtime_iam_policy" "this" {

  runtime_name = ""     # string | required
  id           = ""     # string | optional+computed
  location     = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed
  # policy_data  = ""     # string | computed

}

