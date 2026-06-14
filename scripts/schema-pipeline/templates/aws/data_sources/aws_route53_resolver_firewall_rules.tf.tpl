# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_firewall_rules                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_firewall_rules" "this" {

  firewall_rule_group_id = ""     # string | required
  action                 = ""     # string | optional
  id                     = ""     # string | optional+computed
  priority               = 0      # number | optional

  # firewall_rules = [  # list(object)
  #   {
  #     action = ""
  #     block_override_dns_type = ""
  #     block_override_domain = ""
  #     block_override_ttl = 0
  #     block_response = ""
  #     creation_time = ""
  #     creator_request_id = ""
  #     firewall_domain_list_id = ""
  #     firewall_rule_group_id = ""
  #     modification_time = ""
  #     name = ""
  #     priority = 0
  #   }
  # ]

}

