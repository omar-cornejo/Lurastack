# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_firewall_rule_group            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_firewall_rule_group" "this" {

  name         = ""     # string | required
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed
  # owner_id     = ""     # string | computed
  # share_status = ""     # string | computed

}

