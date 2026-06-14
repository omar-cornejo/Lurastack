# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_acmpca_certificate_authority_certificate        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_acmpca_certificate_authority_certificate" "this" {

  certificate               = ""     # string | required
  certificate_authority_arn = ""     # string | required
  certificate_chain         = ""     # string | optional
  id                        = ""     # string | optional+computed

}

