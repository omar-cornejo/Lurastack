# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_domain_name                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_domain_name" "this" {

  certificate_arn     = ""     # string | required
  domain_name         = ""     # string | required
  description         = ""     # string | optional
  id                  = ""     # string | optional+computed

  # appsync_domain_name = ""     # string | computed
  # hosted_zone_id      = ""     # string | computed

}

