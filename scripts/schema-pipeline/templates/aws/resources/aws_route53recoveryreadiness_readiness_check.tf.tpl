# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53recoveryreadiness_readiness_check        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53recoveryreadiness_readiness_check" "this" {

  readiness_check_name = ""     # string | required
  resource_set_name    = ""     # string | required
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed

  timeouts { # single
    delete = ""     # string | optional

  }

}

