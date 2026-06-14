# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_firewall_rule_group_association    │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_firewall_rule_group_association" "this" {

  firewall_rule_group_association_id = ""     # string | required
  id                                 = ""     # string | optional+computed

  # arn                                = ""     # string | computed
  # creation_time                      = ""     # string | computed
  # creator_request_id                 = ""     # string | computed
  # firewall_rule_group_id             = ""     # string | computed
  # managed_owner_name                 = ""     # string | computed
  # modification_time                  = ""     # string | computed
  # mutation_protection                = ""     # string | computed
  # name                               = ""     # string | computed
  # priority                           = 0      # number | computed
  # status                             = ""     # string | computed
  # status_message                     = ""     # string | computed
  # vpc_id                             = ""     # string | computed

}

