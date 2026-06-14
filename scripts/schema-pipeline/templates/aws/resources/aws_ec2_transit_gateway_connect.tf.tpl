# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_connect                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_connect" "this" {

  transit_gateway_id                              = ""     # string | required
  transport_attachment_id                         = ""     # string | required
  id                                              = ""     # string | optional+computed
  protocol                                        = ""     # string | optional
  tags                                            = {}     # map(string) | optional
  tags_all                                        = {}     # map(string) | optional+computed
  transit_gateway_default_route_table_association = false  # bool | optional
  transit_gateway_default_route_table_propagation = false  # bool | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

