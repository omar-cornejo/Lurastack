# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53recoveryreadiness_recovery_group         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53recoveryreadiness_recovery_group" "this" {

  recovery_group_name = ""     # string | required
  cells               = []     # list(string) | optional
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed

  timeouts { # single
    delete = ""     # string | optional

  }

}

