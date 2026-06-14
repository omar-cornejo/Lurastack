# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpclattice_auth_policy                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpclattice_auth_policy" "this" {

  resource_identifier = ""     # string | required
  id                  = ""     # string | optional+computed
  policy              = ""     # string | optional
  state               = ""     # string | optional

}

