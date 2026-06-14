# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_vpc_attachment                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_vpc_attachment" "this" {

  id                                 = ""     # string | optional+computed
  tags                               = {}     # map(string) | optional+computed

  # appliance_mode_support             = ""     # string | computed
  # arn                                = ""     # string | computed
  # dns_support                        = ""     # string | computed
  # ipv6_support                       = ""     # string | computed
  # security_group_referencing_support = ""     # string | computed
  # subnet_ids                         = []     # set(string) | computed
  # transit_gateway_id                 = ""     # string | computed
  # vpc_id                             = ""     # string | computed
  # vpc_owner_id                       = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

