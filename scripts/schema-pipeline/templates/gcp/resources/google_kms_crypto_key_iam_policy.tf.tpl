# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_kms_crypto_key_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_kms_crypto_key_iam_policy" "this" {

  crypto_key_id = ""     # string | required
  policy_data   = ""     # string | required
  id            = ""     # string | optional+computed

  # etag          = ""     # string | computed

}

