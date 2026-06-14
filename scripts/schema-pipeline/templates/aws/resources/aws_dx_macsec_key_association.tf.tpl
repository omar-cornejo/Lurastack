# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_macsec_key_association                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_macsec_key_association" "this" {

  connection_id = ""     # string | required
  cak           = ""     # string | optional
  ckn           = ""     # string | optional+computed
  id            = ""     # string | optional+computed
  secret_arn    = ""     # string | optional+computed

  # start_on      = ""     # string | computed
  # state         = ""     # string | computed

}

