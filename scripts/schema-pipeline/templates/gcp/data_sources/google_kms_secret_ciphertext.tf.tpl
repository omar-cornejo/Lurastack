# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_secret_ciphertext                            │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
data "google_kms_secret_ciphertext" "this" {

  crypto_key = ""     # string | required
  plaintext  = ""     # string | required+sensitive
  id         = ""     # string | optional+computed

  # ciphertext = ""     # string | computed

}

