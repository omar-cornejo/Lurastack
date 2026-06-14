# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedpermissions_schema                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedpermissions_schema" "this" {

  policy_store_id = ""     # string | required

  # id              = ""     # string | computed
  # namespaces      = []     # set(string) | computed

  definition { # single
    value = ""     # string | required

  }

}

