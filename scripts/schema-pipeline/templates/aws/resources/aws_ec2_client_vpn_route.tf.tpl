# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_client_vpn_route                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_client_vpn_route" "this" {

  client_vpn_endpoint_id = ""     # string | required
  destination_cidr_block = ""     # string | required
  target_vpc_subnet_id   = ""     # string | required
  description            = ""     # string | optional
  id                     = ""     # string | optional+computed

  # origin                 = ""     # string | computed
  # type                   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

