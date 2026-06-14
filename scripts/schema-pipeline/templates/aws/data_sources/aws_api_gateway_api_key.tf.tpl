# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_api_key                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_api_key" "this" {

  id                = ""     # string | required
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # customer_id       = ""     # string | computed
  # description       = ""     # string | computed
  # enabled           = false  # bool | computed
  # last_updated_date = ""     # string | computed
  # name              = ""     # string | computed
  # value             = ""     # string | computed+sensitive

}

