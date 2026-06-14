# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_integration                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_integration" "this" {

  api_id                                    = ""     # string | required
  integration_type                          = ""     # string | required
  connection_id                             = ""     # string | optional
  connection_type                           = ""     # string | optional
  content_handling_strategy                 = ""     # string | optional
  credentials_arn                           = ""     # string | optional
  description                               = ""     # string | optional
  id                                        = ""     # string | optional+computed
  integration_method                        = ""     # string | optional
  integration_subtype                       = ""     # string | optional
  integration_uri                           = ""     # string | optional
  passthrough_behavior                      = ""     # string | optional
  payload_format_version                    = ""     # string | optional
  request_parameters                        = {}     # map(string) | optional
  request_templates                         = {}     # map(string) | optional
  template_selection_expression             = ""     # string | optional
  timeout_milliseconds                      = 0      # number | optional+computed

  # integration_response_selection_expression = ""     # string | computed

  response_parameters { # set
    mappings    = {}     # map(string) | required
    status_code = ""     # string | required

  }

  tls_config { # list [0..1]
    server_name_to_verify = ""     # string | optional

  }

}

