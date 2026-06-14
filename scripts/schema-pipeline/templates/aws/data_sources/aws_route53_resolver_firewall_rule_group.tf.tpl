# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_firewall_rule_group                │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_firewall_rule_group" "this" {

  firewall_rule_group_id = ""     # string | required
  id                     = ""     # string | optional+computed

  # arn                    = ""     # string | computed
  # creation_time          = ""     # string | computed
  # creator_request_id     = ""     # string | computed
  # modification_time      = ""     # string | computed
  # name                   = ""     # string | computed
  # owner_id               = ""     # string | computed
  # rule_count             = 0      # number | computed
  # share_status           = ""     # string | computed
  # status                 = ""     # string | computed
  # status_message         = ""     # string | computed

}

