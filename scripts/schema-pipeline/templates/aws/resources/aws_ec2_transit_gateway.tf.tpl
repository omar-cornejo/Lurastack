# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway" "this" {

  amazon_side_asn                    = 0      # number | optional
  auto_accept_shared_attachments     = ""     # string | optional
  default_route_table_association    = ""     # string | optional
  default_route_table_propagation    = ""     # string | optional
  description                        = ""     # string | optional
  dns_support                        = ""     # string | optional
  id                                 = ""     # string | optional+computed
  multicast_support                  = ""     # string | optional
  security_group_referencing_support = ""     # string | optional
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed
  transit_gateway_cidr_blocks        = []     # set(string) | optional
  vpn_ecmp_support                   = ""     # string | optional

  # arn                                = ""     # string | computed
  # association_default_route_table_id = ""     # string | computed
  # owner_id                           = ""     # string | computed
  # propagation_default_route_table_id = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

