# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_customer_gateway                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_customer_gateway" "this" {

  type             = ""     # string | required
  bgp_asn          = ""     # string | optional
  bgp_asn_extended = ""     # string | optional
  certificate_arn  = ""     # string | optional
  device_name      = ""     # string | optional
  id               = ""     # string | optional+computed
  ip_address       = ""     # string | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed

}

