# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpn_gateway_attachment                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpn_gateway_attachment" "this" {

  vpc_id         = ""     # string | required
  vpn_gateway_id = ""     # string | required
  id             = ""     # string | optional+computed

}

