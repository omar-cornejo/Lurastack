# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_vpn_attachment                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_vpn_attachment" "this" {

  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed
  transit_gateway_id = ""     # string | optional
  vpn_connection_id  = ""     # string | optional

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

