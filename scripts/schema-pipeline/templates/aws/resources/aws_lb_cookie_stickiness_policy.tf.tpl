# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lb_cookie_stickiness_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lb_cookie_stickiness_policy" "this" {

  lb_port                  = 0      # number | required
  load_balancer            = ""     # string | required
  name                     = ""     # string | required
  cookie_expiration_period = 0      # number | optional
  id                       = ""     # string | optional+computed

}

