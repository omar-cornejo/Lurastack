# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_static_ip_attachment                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_static_ip_attachment" "this" {

  instance_name  = ""     # string | required
  static_ip_name = ""     # string | required
  id             = ""     # string | optional+computed

  # ip_address     = ""     # string | computed

}

