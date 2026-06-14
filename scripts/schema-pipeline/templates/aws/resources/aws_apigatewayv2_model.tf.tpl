# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_model                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_model" "this" {

  api_id       = ""     # string | required
  content_type = ""     # string | required
  name         = ""     # string | required
  schema       = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed

}

