# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_integration_response                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_integration_response" "this" {

  http_method         = ""     # string | required
  resource_id         = ""     # string | required
  rest_api_id         = ""     # string | required
  status_code         = ""     # string | required
  content_handling    = ""     # string | optional
  id                  = ""     # string | optional+computed
  response_parameters = {}     # map(string) | optional
  response_templates  = {}     # map(string) | optional
  selection_pattern   = ""     # string | optional

}

