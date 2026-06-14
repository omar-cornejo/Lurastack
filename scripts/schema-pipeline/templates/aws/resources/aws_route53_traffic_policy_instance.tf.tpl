# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_traffic_policy_instance                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_traffic_policy_instance" "this" {

  hosted_zone_id         = ""     # string | required
  name                   = ""     # string | required
  traffic_policy_id      = ""     # string | required
  traffic_policy_version = 0      # number | required
  ttl                    = 0      # number | required
  id                     = ""     # string | optional+computed

  # arn                    = ""     # string | computed

}

