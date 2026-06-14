# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_multicast_group_source      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_multicast_group_source" "this" {

  group_ip_address                    = ""     # string | required
  network_interface_id                = ""     # string | required
  transit_gateway_multicast_domain_id = ""     # string | required
  id                                  = ""     # string | optional+computed

}

