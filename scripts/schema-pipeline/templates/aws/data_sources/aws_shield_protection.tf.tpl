# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_shield_protection                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_shield_protection" "this" {

  protection_id  = ""     # string | optional+computed
  resource_arn   = ""     # string | optional+computed

  # id             = ""     # string | computed
  # name           = ""     # string | computed
  # protection_arn = ""     # string | computed

}

