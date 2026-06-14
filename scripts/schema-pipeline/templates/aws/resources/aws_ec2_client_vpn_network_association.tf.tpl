# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_client_vpn_network_association              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_client_vpn_network_association" "this" {

  client_vpn_endpoint_id = ""     # string | required
  subnet_id              = ""     # string | required
  id                     = ""     # string | optional+computed

  # association_id         = ""     # string | computed
  # vpc_id                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

