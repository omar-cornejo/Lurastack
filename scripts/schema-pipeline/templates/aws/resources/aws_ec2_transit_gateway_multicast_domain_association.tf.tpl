# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_multicast_domain_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_multicast_domain_association" "this" {

  subnet_id                           = ""     # string | required
  transit_gateway_attachment_id       = ""     # string | required
  transit_gateway_multicast_domain_id = ""     # string | required
  id                                  = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

