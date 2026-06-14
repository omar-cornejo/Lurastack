# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_acmpca_certificate                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_acmpca_certificate" "this" {

  arn                       = ""     # string | required
  certificate_authority_arn = ""     # string | required
  id                        = ""     # string | optional+computed

  # certificate               = ""     # string | computed
  # certificate_chain         = ""     # string | computed

}

