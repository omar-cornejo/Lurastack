# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_waf_subscribed_rule_group                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_waf_subscribed_rule_group" "this" {

  id          = ""     # string | optional+computed
  metric_name = ""     # string | optional
  name        = ""     # string | optional

}

