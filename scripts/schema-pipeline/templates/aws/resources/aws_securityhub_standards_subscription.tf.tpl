# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_standards_subscription              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_standards_subscription" "this" {

  standards_arn = ""     # string | required
  id            = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

