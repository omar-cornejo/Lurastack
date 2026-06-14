# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_rule                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_rule" "this" {

  domain_name          = ""     # string | required
  rule_type            = ""     # string | required
  id                   = ""     # string | optional+computed
  name                 = ""     # string | optional
  resolver_endpoint_id = ""     # string | optional
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # owner_id             = ""     # string | computed
  # share_status         = ""     # string | computed

  target_ip { # set
    ip       = ""     # string | optional
    ipv6     = ""     # string | optional
    port     = 0      # number | optional
    protocol = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

