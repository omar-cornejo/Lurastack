# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_usage_plan_key                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_usage_plan_key" "this" {

  key_id        = ""     # string | required
  key_type      = ""     # string | required
  usage_plan_id = ""     # string | required
  id            = ""     # string | optional+computed

  # name          = ""     # string | computed
  # value         = ""     # string | computed

}

