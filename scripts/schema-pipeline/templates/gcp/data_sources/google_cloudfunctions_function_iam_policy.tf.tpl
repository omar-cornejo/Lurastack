# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloudfunctions_function_iam_policy               │
# └──────────────────────────────────────────────────────────────┘
data "google_cloudfunctions_function_iam_policy" "this" {

  cloud_function = ""     # string | required
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed
  region         = ""     # string | optional+computed

  # etag           = ""     # string | computed
  # policy_data    = ""     # string | computed

}

