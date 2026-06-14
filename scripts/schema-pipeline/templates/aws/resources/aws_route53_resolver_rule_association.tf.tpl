# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_rule_association               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_rule_association" "this" {

  resolver_rule_id = ""     # string | required
  vpc_id           = ""     # string | required
  id               = ""     # string | optional+computed
  name             = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

