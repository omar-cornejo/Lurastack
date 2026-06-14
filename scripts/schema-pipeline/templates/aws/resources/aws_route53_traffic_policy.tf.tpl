# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_traffic_policy                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_traffic_policy" "this" {

  document = ""     # string | required
  name     = ""     # string | required
  comment  = ""     # string | optional
  id       = ""     # string | optional+computed

  # arn      = ""     # string | computed
  # type     = ""     # string | computed
  # version  = 0      # number | computed

}

