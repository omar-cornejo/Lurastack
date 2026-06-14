# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_domain_identity_verification                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_domain_identity_verification" "this" {

  domain = ""     # string | required
  id     = ""     # string | optional+computed

  # arn    = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

