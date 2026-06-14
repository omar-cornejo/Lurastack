# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_service_account_iam_policy                       │
# └──────────────────────────────────────────────────────────────┘
data "google_service_account_iam_policy" "this" {

  service_account_id = ""     # string | required
  id                 = ""     # string | optional+computed

  # etag               = ""     # string | computed
  # policy_data        = ""     # string | computed

}

