# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_vpc_attachment              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_vpc_attachment" "this" {

  subnet_ids                                      = []     # set(string) | required
  transit_gateway_id                              = ""     # string | required
  vpc_id                                          = ""     # string | required
  appliance_mode_support                          = ""     # string | optional
  dns_support                                     = ""     # string | optional
  id                                              = ""     # string | optional+computed
  ipv6_support                                    = ""     # string | optional
  security_group_referencing_support              = ""     # string | optional+computed
  tags                                            = {}     # map(string) | optional
  tags_all                                        = {}     # map(string) | optional+computed
  transit_gateway_default_route_table_association = false  # bool | optional+computed
  transit_gateway_default_route_table_propagation = false  # bool | optional+computed

  # arn                                             = ""     # string | computed
  # vpc_owner_id                                    = ""     # string | computed

}

