# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafregional_rule_group                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafregional_rule_group" "this" {

  metric_name = ""     # string | required
  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  activated_rule { # set
    priority = 0      # number | required
    rule_id  = ""     # string | required
    type     = ""     # string | optional

    action { # list [1..1]
      type = ""     # string | required

    }

  }

}

