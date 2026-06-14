# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_config                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_config" "this" {

  autodefined_reverse_flag = ""     # string | required
  resource_id              = ""     # string | required
  id                       = ""     # string | optional+computed

  # owner_id                 = ""     # string | computed

}

