# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_method                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_method" "this" {

  authorization        = ""     # string | required
  http_method          = ""     # string | required
  resource_id          = ""     # string | required
  rest_api_id          = ""     # string | required
  api_key_required     = false  # bool | optional
  authorization_scopes = []     # set(string) | optional
  authorizer_id        = ""     # string | optional
  id                   = ""     # string | optional+computed
  operation_name       = ""     # string | optional
  request_models       = {}     # map(string) | optional
  request_parameters   = {}     # map(bool) | optional
  request_validator_id = ""     # string | optional

}

