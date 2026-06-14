# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_gateway                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_gateway" "this" {

  amazon_side_asn  = ""     # string | required
  name             = ""     # string | required
  id               = ""     # string | optional+computed

  # arn              = ""     # string | computed
  # owner_account_id = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

