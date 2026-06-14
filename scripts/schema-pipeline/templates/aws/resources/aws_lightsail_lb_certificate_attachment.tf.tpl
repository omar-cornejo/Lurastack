# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_lb_certificate_attachment             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_lb_certificate_attachment" "this" {

  certificate_name = ""     # string | required
  lb_name          = ""     # string | required
  id               = ""     # string | optional+computed

}

