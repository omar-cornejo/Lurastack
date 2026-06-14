# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_billing_account_iam_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_billing_account_iam_policy" "this" {

  billing_account_id = ""     # string | required
  policy_data        = ""     # string | required
  id                 = ""     # string | optional+computed

  # etag               = ""     # string | computed

}

