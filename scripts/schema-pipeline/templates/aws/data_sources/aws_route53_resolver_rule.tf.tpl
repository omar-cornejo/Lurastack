# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_rule                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_rule" "this" {

  domain_name          = ""     # string | optional+computed
  id                   = ""     # string | optional+computed
  name                 = ""     # string | optional+computed
  resolver_endpoint_id = ""     # string | optional+computed
  resolver_rule_id     = ""     # string | optional+computed
  rule_type            = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # owner_id             = ""     # string | computed
  # share_status         = ""     # string | computed

}

