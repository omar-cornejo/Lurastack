# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway" "this" {

  id                                 = ""     # string | optional+computed
  tags                               = {}     # map(string) | optional+computed

  # amazon_side_asn                    = 0      # number | computed
  # arn                                = ""     # string | computed
  # association_default_route_table_id = ""     # string | computed
  # auto_accept_shared_attachments     = ""     # string | computed
  # default_route_table_association    = ""     # string | computed
  # default_route_table_propagation    = ""     # string | computed
  # description                        = ""     # string | computed
  # dns_support                        = ""     # string | computed
  # multicast_support                  = ""     # string | computed
  # owner_id                           = ""     # string | computed
  # propagation_default_route_table_id = ""     # string | computed
  # security_group_referencing_support = ""     # string | computed
  # transit_gateway_cidr_blocks        = []     # list(string) | computed
  # vpn_ecmp_support                   = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

