# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_notebooks_runtime_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_notebooks_runtime_iam_policy" "this" {

  policy_data  = ""     # string | required
  runtime_name = ""     # string | required
  id           = ""     # string | optional+computed
  location     = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed

}

