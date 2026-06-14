# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_rest_api_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_rest_api_policy" "this" {

  policy      = ""     # string | required
  rest_api_id = ""     # string | required
  id          = ""     # string | optional+computed

}

