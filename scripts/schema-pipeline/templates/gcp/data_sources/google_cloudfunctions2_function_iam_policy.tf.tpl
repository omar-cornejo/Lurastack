# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloudfunctions2_function_iam_policy              │
# └──────────────────────────────────────────────────────────────┘
data "google_cloudfunctions2_function_iam_policy" "this" {

  cloud_function = ""     # string | required
  id             = ""     # string | optional+computed
  location       = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  # etag           = ""     # string | computed
  # policy_data    = ""     # string | computed

}

