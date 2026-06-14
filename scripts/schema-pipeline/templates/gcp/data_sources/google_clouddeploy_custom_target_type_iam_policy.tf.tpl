# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_clouddeploy_custom_target_type_iam_policy        │
# └──────────────────────────────────────────────────────────────┘
data "google_clouddeploy_custom_target_type_iam_policy" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

