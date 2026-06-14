# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloudfunctions_function_iam_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloudfunctions_function_iam_policy" "this" {

  cloud_function = ""     # string | required
  policy_data    = ""     # string | required
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed
  region         = ""     # string | optional+computed

  # etag           = ""     # string | computed

}

