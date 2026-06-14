# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpn_gateway                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpn_gateway" "this" {

  amazon_side_asn   = ""     # string | optional+computed
  availability_zone = ""     # string | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  vpc_id            = ""     # string | optional+computed

  # arn               = ""     # string | computed

}

