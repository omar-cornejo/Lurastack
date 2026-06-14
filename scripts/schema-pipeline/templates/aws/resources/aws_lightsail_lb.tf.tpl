# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_lb                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_lb" "this" {

  instance_port     = 0      # number | required
  name              = ""     # string | required
  health_check_path = ""     # string | optional
  id                = ""     # string | optional+computed
  ip_address_type   = ""     # string | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_at        = ""     # string | computed
  # dns_name          = ""     # string | computed
  # protocol          = ""     # string | computed
  # public_ports      = []     # list(number) | computed
  # support_code      = ""     # string | computed

}

