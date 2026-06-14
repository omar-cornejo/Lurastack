# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_lb_attachment                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_lb_attachment" "this" {

  instance_name = ""     # string | required
  lb_name       = ""     # string | required
  id            = ""     # string | optional+computed

}

