# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_hosted_public_virtual_interface              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_hosted_public_virtual_interface" "this" {

  address_family        = ""     # string | required
  bgp_asn               = 0      # number | required
  connection_id         = ""     # string | required
  name                  = ""     # string | required
  owner_account_id      = ""     # string | required
  route_filter_prefixes = []     # set(string) | required
  vlan                  = 0      # number | required
  amazon_address        = ""     # string | optional+computed
  bgp_auth_key          = ""     # string | optional+computed
  customer_address      = ""     # string | optional+computed
  id                    = ""     # string | optional+computed

  # amazon_side_asn       = ""     # string | computed
  # arn                   = ""     # string | computed
  # aws_device            = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

