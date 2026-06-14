# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_route_response                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_route_response" "this" {

  api_id                     = ""     # string | required
  route_id                   = ""     # string | required
  route_response_key         = ""     # string | required
  id                         = ""     # string | optional+computed
  model_selection_expression = ""     # string | optional
  response_models            = {}     # map(string) | optional

}

