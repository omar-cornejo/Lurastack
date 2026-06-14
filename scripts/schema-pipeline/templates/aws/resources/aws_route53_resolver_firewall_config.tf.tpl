# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_firewall_config                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_firewall_config" "this" {

  resource_id        = ""     # string | required
  firewall_fail_open = ""     # string | optional+computed
  id                 = ""     # string | optional+computed

  # owner_id           = ""     # string | computed

}

