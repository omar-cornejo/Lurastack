# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_multicast_domain                │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_multicast_domain" "this" {

  id                                  = ""     # string | optional+computed
  tags                                = {}     # map(string) | optional+computed
  transit_gateway_multicast_domain_id = ""     # string | optional+computed

  # arn                                 = ""     # string | computed
  # associations = [  # list(object)
  #   {
  #     subnet_id = ""
  #     transit_gateway_attachment_id = ""
  #   }
  # ]
  # auto_accept_shared_associations     = ""     # string | computed
  # igmpv2_support                      = ""     # string | computed
  # members = [  # list(object)
  #   {
  #     group_ip_address = ""
  #     network_interface_id = ""
  #   }
  # ]
  # owner_id                            = ""     # string | computed
  # sources = [  # list(object)
  #   {
  #     group_ip_address = ""
  #     network_interface_id = ""
  #   }
  # ]
  # state                               = ""     # string | computed
  # static_sources_support              = ""     # string | computed
  # transit_gateway_attachment_id       = ""     # string | computed
  # transit_gateway_id                  = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

