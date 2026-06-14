# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lb_listener_certificate                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lb_listener_certificate" "this" {

  certificate_arn = ""     # string | required
  listener_arn    = ""     # string | required
  id              = ""     # string | optional+computed

}

