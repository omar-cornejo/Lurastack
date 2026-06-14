# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_zone_association                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_zone_association" "this" {

  vpc_id         = ""     # string | required
  zone_id        = ""     # string | required
  id             = ""     # string | optional+computed
  vpc_region     = ""     # string | optional+computed

  # owning_account = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

