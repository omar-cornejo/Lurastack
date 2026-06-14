# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_acmpca_certificate                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_acmpca_certificate" "this" {

  certificate_authority_arn   = ""     # string | required
  certificate_signing_request = ""     # string | required
  signing_algorithm           = ""     # string | required
  api_passthrough             = ""     # string | optional
  id                          = ""     # string | optional+computed
  template_arn                = ""     # string | optional

  # arn                         = ""     # string | computed
  # certificate                 = ""     # string | computed
  # certificate_chain           = ""     # string | computed

  validity { # list [1..1]
    type  = ""     # string | required
    value = ""     # string | required

  }

}

