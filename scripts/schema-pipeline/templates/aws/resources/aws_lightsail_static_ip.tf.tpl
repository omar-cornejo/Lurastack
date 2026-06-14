# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_static_ip                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_static_ip" "this" {

  name         = ""     # string | required
  id           = ""     # string | optional+computed

  # arn          = ""     # string | computed
  # ip_address   = ""     # string | computed
  # support_code = ""     # string | computed

}

