# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_firewall_config                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_firewall_config" "this" {

  resource_id        = ""     # string | required
  id                 = ""     # string | optional+computed

  # firewall_fail_open = ""     # string | computed
  # owner_id           = ""     # string | computed

}

