# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_firewall_domain_list           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_firewall_domain_list" "this" {

  name     = ""     # string | required
  domains  = []     # set(string) | optional
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

}

