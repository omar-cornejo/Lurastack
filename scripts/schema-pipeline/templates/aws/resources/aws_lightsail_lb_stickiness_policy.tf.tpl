# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_lb_stickiness_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_lb_stickiness_policy" "this" {

  cookie_duration = 0      # number | required
  enabled         = false  # bool | required
  lb_name         = ""     # string | required
  id              = ""     # string | optional+computed

}

