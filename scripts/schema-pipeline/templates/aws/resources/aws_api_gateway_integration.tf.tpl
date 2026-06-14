# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_integration                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_integration" "this" {

  http_method             = ""     # string | required
  resource_id             = ""     # string | required
  rest_api_id             = ""     # string | required
  type                    = ""     # string | required
  cache_key_parameters    = []     # set(string) | optional
  cache_namespace         = ""     # string | optional+computed
  connection_id           = ""     # string | optional
  connection_type         = ""     # string | optional
  content_handling        = ""     # string | optional
  credentials             = ""     # string | optional
  id                      = ""     # string | optional+computed
  integration_http_method = ""     # string | optional
  passthrough_behavior    = ""     # string | optional+computed
  request_parameters      = {}     # map(string) | optional
  request_templates       = {}     # map(string) | optional
  timeout_milliseconds    = 0      # number | optional
  uri                     = ""     # string | optional

  tls_config { # list [0..1]
    insecure_skip_verification = false  # bool | optional

  }

}

