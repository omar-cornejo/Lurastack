# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_api_mapping                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_api_mapping" "this" {

  api_id          = ""     # string | required
  domain_name     = ""     # string | required
  stage           = ""     # string | required
  api_mapping_key = ""     # string | optional
  id              = ""     # string | optional+computed

}

