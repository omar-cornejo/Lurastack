# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_billing_account_iam_policy                       │
# └──────────────────────────────────────────────────────────────┘
data "google_billing_account_iam_policy" "this" {

  billing_account_id = ""     # string | required
  id                 = ""     # string | optional+computed

  # etag               = ""     # string | computed
  # policy_data        = ""     # string | computed

}

