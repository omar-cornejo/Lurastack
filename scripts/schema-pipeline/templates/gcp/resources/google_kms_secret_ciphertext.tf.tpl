# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_kms_secret_ciphertext                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_kms_secret_ciphertext" "this" {

  crypto_key                    = ""     # string | required | The full name of the CryptoKey that will be used to encrypt …
  plaintext                     = ""     # string | required+sensitive | The plaintext to be encrypted.
  additional_authenticated_data = ""     # string | optional+sensitive | The additional authenticated data used for integrity checks …
  id                            = ""     # string | optional+computed

  # ciphertext                    = ""     # string | computed | Contains the result of encrypting the provided plaintext, en…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

