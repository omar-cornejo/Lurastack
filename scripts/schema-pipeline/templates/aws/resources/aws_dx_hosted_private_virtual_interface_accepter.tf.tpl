# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_hosted_private_virtual_interface_accepter    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_hosted_private_virtual_interface_accepter" "this" {

  virtual_interface_id = ""     # string | required
  dx_gateway_id        = ""     # string | optional
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed
  vpn_gateway_id       = ""     # string | optional

  # arn                  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

