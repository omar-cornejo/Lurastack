# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_app_cookie_stickiness_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_app_cookie_stickiness_policy" "this" {

  cookie_name   = ""     # string | required
  lb_port       = 0      # number | required
  load_balancer = ""     # string | required
  name          = ""     # string | required
  id            = ""     # string | optional+computed

}

