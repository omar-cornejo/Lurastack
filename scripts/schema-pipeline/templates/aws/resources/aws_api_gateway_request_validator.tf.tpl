# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_request_validator                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_request_validator" "this" {

  name                        = ""     # string | required
  rest_api_id                 = ""     # string | required
  id                          = ""     # string | optional+computed
  validate_request_body       = false  # bool | optional
  validate_request_parameters = false  # bool | optional

}

