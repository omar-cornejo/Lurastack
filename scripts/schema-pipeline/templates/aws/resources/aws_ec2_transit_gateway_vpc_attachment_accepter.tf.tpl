# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_vpc_attachment_accepter     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "this" {

  transit_gateway_attachment_id                   = ""     # string | required
  id                                              = ""     # string | optional+computed
  tags                                            = {}     # map(string) | optional
  tags_all                                        = {}     # map(string) | optional+computed
  transit_gateway_default_route_table_association = false  # bool | optional
  transit_gateway_default_route_table_propagation = false  # bool | optional

  # appliance_mode_support                          = ""     # string | computed
  # dns_support                                     = ""     # string | computed
  # ipv6_support                                    = ""     # string | computed
  # security_group_referencing_support              = ""     # string | computed
  # subnet_ids                                      = []     # set(string) | computed
  # transit_gateway_id                              = ""     # string | computed
  # vpc_id                                          = ""     # string | computed
  # vpc_owner_id                                    = ""     # string | computed

}

