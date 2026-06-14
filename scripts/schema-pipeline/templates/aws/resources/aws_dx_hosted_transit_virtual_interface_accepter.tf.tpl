# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_hosted_transit_virtual_interface_accepter    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_hosted_transit_virtual_interface_accepter" "this" {

  dx_gateway_id        = ""     # string | required
  virtual_interface_id = ""     # string | required
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

