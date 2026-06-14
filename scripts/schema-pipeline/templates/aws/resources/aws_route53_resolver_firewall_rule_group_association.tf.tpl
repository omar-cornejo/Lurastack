# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_firewall_rule_group_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_firewall_rule_group_association" "this" {

  firewall_rule_group_id = ""     # string | required
  name                   = ""     # string | required
  priority               = 0      # number | required
  vpc_id                 = ""     # string | required
  id                     = ""     # string | optional+computed
  mutation_protection    = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed

}

