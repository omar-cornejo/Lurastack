# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_endpoint                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_endpoint" "this" {

  direction              = ""     # string | required
  security_group_ids     = []     # set(string) | required
  id                     = ""     # string | optional+computed
  name                   = ""     # string | optional
  protocols              = []     # set(string) | optional+computed
  resolver_endpoint_type = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # host_vpc_id            = ""     # string | computed

  ip_address { # set [2..10]
    subnet_id = ""     # string | required
    ip        = ""     # string | optional+computed
    ipv6      = ""     # string | optional+computed

    # ip_id     = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

