# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_gateway_response                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_gateway_response" "this" {

  response_type       = ""     # string | required
  rest_api_id         = ""     # string | required
  id                  = ""     # string | optional+computed
  response_parameters = {}     # map(string) | optional
  response_templates  = {}     # map(string) | optional
  status_code         = ""     # string | optional

}

