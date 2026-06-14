# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_authorizer                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_authorizer" "this" {

  api_id                            = ""     # string | required
  authorizer_type                   = ""     # string | required
  name                              = ""     # string | required
  authorizer_credentials_arn        = ""     # string | optional
  authorizer_payload_format_version = ""     # string | optional
  authorizer_result_ttl_in_seconds  = 0      # number | optional+computed
  authorizer_uri                    = ""     # string | optional
  enable_simple_responses           = false  # bool | optional
  id                                = ""     # string | optional+computed
  identity_sources                  = []     # set(string) | optional

  jwt_configuration { # list [0..1]
    audience = []     # set(string) | optional
    issuer   = ""     # string | optional

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

