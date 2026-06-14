# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_acm_certificate_validation                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_acm_certificate_validation" "this" {

  certificate_arn         = ""     # string | required
  id                      = ""     # string | optional+computed
  validation_record_fqdns = []     # set(string) | optional

  timeouts { # single
    create = ""     # string | optional

  }

}

