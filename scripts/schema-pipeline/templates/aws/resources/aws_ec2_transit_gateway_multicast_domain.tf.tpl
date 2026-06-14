# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_multicast_domain            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_multicast_domain" "this" {

  transit_gateway_id              = ""     # string | required
  auto_accept_shared_associations = ""     # string | optional
  id                              = ""     # string | optional+computed
  igmpv2_support                  = ""     # string | optional
  static_sources_support          = ""     # string | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # owner_id                        = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

