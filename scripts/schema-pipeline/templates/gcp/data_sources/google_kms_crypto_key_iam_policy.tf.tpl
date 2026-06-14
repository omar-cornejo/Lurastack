# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_crypto_key_iam_policy                        │
# └──────────────────────────────────────────────────────────────┘
data "google_kms_crypto_key_iam_policy" "this" {

  crypto_key_id = ""     # string | required
  id            = ""     # string | optional+computed

  # etag          = ""     # string | computed
  # policy_data   = ""     # string | computed

}

