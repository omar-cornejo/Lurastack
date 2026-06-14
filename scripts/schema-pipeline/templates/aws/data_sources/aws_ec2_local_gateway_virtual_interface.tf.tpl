# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_local_gateway_virtual_interface                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_local_gateway_virtual_interface" "this" {

  id                                  = ""     # string | optional+computed
  tags                                = {}     # map(string) | optional+computed

  # local_address                       = ""     # string | computed
  # local_bgp_asn                       = 0      # number | computed
  # local_gateway_id                    = ""     # string | computed
  # local_gateway_virtual_interface_ids = []     # set(string) | computed
  # peer_address                        = ""     # string | computed
  # peer_bgp_asn                        = 0      # number | computed
  # vlan                                = 0      # number | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

