# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dx_gateway                                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_dx_gateway" "this" {

  name             = ""     # string | required
  id               = ""     # string | optional+computed

  # amazon_side_asn  = ""     # string | computed
  # arn              = ""     # string | computed
  # owner_account_id = ""     # string | computed

}

