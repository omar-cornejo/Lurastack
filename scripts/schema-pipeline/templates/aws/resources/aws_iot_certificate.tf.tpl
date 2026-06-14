# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_certificate                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_certificate" "this" {

  active            = false  # bool | required
  ca_pem            = ""     # string | optional+sensitive
  certificate_pem   = ""     # string | optional+computed+sensitive
  csr               = ""     # string | optional
  id                = ""     # string | optional+computed

  # arn               = ""     # string | computed
  # ca_certificate_id = ""     # string | computed
  # private_key       = ""     # string | computed+sensitive
  # public_key        = ""     # string | computed+sensitive

}

