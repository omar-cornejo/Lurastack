# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_alb_listener_certificate                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_alb_listener_certificate" "this" {

  certificate_arn = ""     # string | required
  listener_arn    = ""     # string | required
  id              = ""     # string | optional+computed

}

