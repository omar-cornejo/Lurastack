# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_api_key                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_api_key" "this" {

  name              = ""     # string | required
  customer_id       = ""     # string | optional
  description       = ""     # string | optional
  enabled           = false  # bool | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  value             = ""     # string | optional+computed+sensitive

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed

}

