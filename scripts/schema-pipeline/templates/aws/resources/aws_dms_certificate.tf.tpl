# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dms_certificate                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dms_certificate" "this" {

  certificate_id     = ""     # string | required
  certificate_pem    = ""     # string | optional+sensitive
  certificate_wallet = ""     # string | optional+sensitive
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # certificate_arn    = ""     # string | computed

}

