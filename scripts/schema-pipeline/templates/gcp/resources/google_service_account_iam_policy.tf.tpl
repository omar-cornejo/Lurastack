# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_service_account_iam_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_service_account_iam_policy" "this" {

  policy_data        = ""     # string | required
  service_account_id = ""     # string | required
  id                 = ""     # string | optional+computed

  # etag               = ""     # string | computed

}

