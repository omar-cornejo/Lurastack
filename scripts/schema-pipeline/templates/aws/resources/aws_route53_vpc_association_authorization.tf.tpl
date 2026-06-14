# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_vpc_association_authorization           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_vpc_association_authorization" "this" {

  vpc_id     = ""     # string | required
  zone_id    = ""     # string | required
  id         = ""     # string | optional+computed
  vpc_region = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}

