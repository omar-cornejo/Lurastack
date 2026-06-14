# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_rules                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_rules" "this" {

  id                   = ""     # string | optional+computed
  name_regex           = ""     # string | optional
  owner_id             = ""     # string | optional
  resolver_endpoint_id = ""     # string | optional
  rule_type            = ""     # string | optional
  share_status         = ""     # string | optional

  # resolver_rule_ids    = []     # set(string) | computed

}

