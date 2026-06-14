# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_secret                                       │
# └──────────────────────────────────────────────────────────────┘
data "google_kms_secret" "this" {

  ciphertext                    = ""     # string | required
  crypto_key                    = ""     # string | required
  additional_authenticated_data = ""     # string | optional
  id                            = ""     # string | optional+computed

  # plaintext                     = ""     # string | computed+sensitive

}

