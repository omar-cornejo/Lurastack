# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_crypto_key_version                           │
# └──────────────────────────────────────────────────────────────┘
data "google_kms_crypto_key_version" "this" {

  crypto_key       = ""     # string | required
  id               = ""     # string | optional+computed
  version          = 0      # number | optional

  # algorithm        = ""     # string | computed
  # name             = ""     # string | computed
  # protection_level = ""     # string | computed
  # public_key = [  # list(object)
  #   {
  #     algorithm = ""
  #     pem = ""
  #   }
  # ]
  # state            = ""     # string | computed

}

