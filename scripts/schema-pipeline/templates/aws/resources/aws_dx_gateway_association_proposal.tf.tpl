# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_gateway_association_proposal                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_gateway_association_proposal" "this" {

  associated_gateway_id               = ""     # string | required
  dx_gateway_id                       = ""     # string | required
  dx_gateway_owner_account_id         = ""     # string | required
  allowed_prefixes                    = []     # set(string) | optional+computed
  id                                  = ""     # string | optional+computed

  # associated_gateway_owner_account_id = ""     # string | computed
  # associated_gateway_type             = ""     # string | computed

}

