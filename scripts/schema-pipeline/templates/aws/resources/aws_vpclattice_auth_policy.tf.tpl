# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_auth_policy                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_auth_policy" "this" {

  policy              = ""     # string | required
  resource_identifier = ""     # string | required
  id                  = ""     # string | optional+computed
  state               = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

