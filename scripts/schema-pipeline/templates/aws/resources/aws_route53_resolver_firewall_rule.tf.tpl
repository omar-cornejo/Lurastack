# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_firewall_rule                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_firewall_rule" "this" {

  action                             = ""     # string | required
  firewall_domain_list_id            = ""     # string | required
  firewall_rule_group_id             = ""     # string | required
  name                               = ""     # string | required
  priority                           = 0      # number | required
  block_override_dns_type            = ""     # string | optional
  block_override_domain              = ""     # string | optional
  block_override_ttl                 = 0      # number | optional
  block_response                     = ""     # string | optional
  firewall_domain_redirection_action = ""     # string | optional
  id                                 = ""     # string | optional+computed
  q_type                             = ""     # string | optional

}

