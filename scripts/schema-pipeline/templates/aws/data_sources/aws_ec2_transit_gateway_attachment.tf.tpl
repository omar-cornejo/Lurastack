# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_attachment                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_attachment" "this" {

  id                                         = ""     # string | optional+computed
  tags                                       = {}     # map(string) | optional+computed
  transit_gateway_attachment_id              = ""     # string | optional+computed

  # arn                                        = ""     # string | computed
  # association_state                          = ""     # string | computed
  # association_transit_gateway_route_table_id = ""     # string | computed
  # resource_id                                = ""     # string | computed
  # resource_owner_id                          = ""     # string | computed
  # resource_type                              = ""     # string | computed
  # state                                      = ""     # string | computed
  # transit_gateway_id                         = ""     # string | computed
  # transit_gateway_owner_id                   = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

