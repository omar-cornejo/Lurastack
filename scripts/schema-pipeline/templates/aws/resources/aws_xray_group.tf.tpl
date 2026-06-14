# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_xray_group                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_xray_group" "this" {

  filter_expression = ""     # string | required
  group_name        = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed

  insights_configuration { # list [0..1]
    insights_enabled      = false  # bool | required
    notifications_enabled = false  # bool | optional+computed

  }

}

