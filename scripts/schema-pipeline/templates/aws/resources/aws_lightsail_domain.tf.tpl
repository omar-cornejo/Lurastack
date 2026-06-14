# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_domain                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_domain" "this" {

  domain_name = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed

}

