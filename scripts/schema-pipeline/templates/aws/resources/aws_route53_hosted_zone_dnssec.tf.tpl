# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_hosted_zone_dnssec                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_hosted_zone_dnssec" "this" {

  hosted_zone_id = ""     # string | required
  id             = ""     # string | optional+computed
  signing_status = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

