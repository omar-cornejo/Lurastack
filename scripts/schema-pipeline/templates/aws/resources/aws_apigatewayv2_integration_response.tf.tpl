# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_integration_response               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_integration_response" "this" {

  api_id                        = ""     # string | required
  integration_id                = ""     # string | required
  integration_response_key      = ""     # string | required
  content_handling_strategy     = ""     # string | optional
  id                            = ""     # string | optional+computed
  response_templates            = {}     # map(string) | optional
  template_selection_expression = ""     # string | optional

}

