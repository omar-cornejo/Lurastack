# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dms_certificate                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_dms_certificate" "this" {

  certificate_id            = ""     # string | required
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # certificate_arn           = ""     # string | computed
  # certificate_creation_date = ""     # string | computed
  # certificate_owner         = ""     # string | computed
  # certificate_pem           = ""     # string | computed+sensitive
  # certificate_wallet        = ""     # string | computed+sensitive
  # key_length                = 0      # number | computed
  # signing_algorithm         = ""     # string | computed
  # valid_from_date           = ""     # string | computed
  # valid_to_date             = ""     # string | computed

}

