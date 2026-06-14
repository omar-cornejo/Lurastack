# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_private_virtual_interface                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_private_virtual_interface" "this" {

  address_family      = ""     # string | required
  bgp_asn             = 0      # number | required
  connection_id       = ""     # string | required
  name                = ""     # string | required
  vlan                = 0      # number | required
  amazon_address      = ""     # string | optional+computed
  bgp_auth_key        = ""     # string | optional+computed
  customer_address    = ""     # string | optional+computed
  dx_gateway_id       = ""     # string | optional
  id                  = ""     # string | optional+computed
  mtu                 = 0      # number | optional
  sitelink_enabled    = false  # bool | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed
  vpn_gateway_id      = ""     # string | optional

  # amazon_side_asn     = ""     # string | computed
  # arn                 = ""     # string | computed
  # aws_device          = ""     # string | computed
  # jumbo_frame_capable = false  # bool | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

