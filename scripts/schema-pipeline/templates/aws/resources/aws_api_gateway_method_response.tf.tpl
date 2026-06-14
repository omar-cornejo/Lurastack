# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_method_response                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_method_response" "this" {

  http_method         = ""     # string | required
  resource_id         = ""     # string | required
  rest_api_id         = ""     # string | required
  status_code         = ""     # string | required
  id                  = ""     # string | optional+computed
  response_models     = {}     # map(string) | optional
  response_parameters = {}     # map(bool) | optional

}

