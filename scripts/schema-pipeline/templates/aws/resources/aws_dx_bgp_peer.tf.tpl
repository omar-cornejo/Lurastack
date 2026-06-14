# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_bgp_peer                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_bgp_peer" "this" {

  address_family       = ""     # string | required
  bgp_asn              = 0      # number | required
  virtual_interface_id = ""     # string | required
  amazon_address       = ""     # string | optional+computed
  bgp_auth_key         = ""     # string | optional+computed
  customer_address     = ""     # string | optional+computed
  id                   = ""     # string | optional+computed

  # aws_device           = ""     # string | computed
  # bgp_peer_id          = ""     # string | computed
  # bgp_status           = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

