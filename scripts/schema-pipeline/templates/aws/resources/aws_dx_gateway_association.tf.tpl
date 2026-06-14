# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_gateway_association                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_gateway_association" "this" {

  dx_gateway_id                       = ""     # string | required
  allowed_prefixes                    = []     # set(string) | optional+computed
  associated_gateway_id               = ""     # string | optional+computed
  associated_gateway_owner_account_id = ""     # string | optional+computed
  id                                  = ""     # string | optional+computed
  proposal_id                         = ""     # string | optional
  vpn_gateway_id                      = ""     # string | optional+DEPRECATED

  # associated_gateway_type             = ""     # string | computed
  # dx_gateway_association_id           = ""     # string | computed
  # dx_gateway_owner_account_id         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

