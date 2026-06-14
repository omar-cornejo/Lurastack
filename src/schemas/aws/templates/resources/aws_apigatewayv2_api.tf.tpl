# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_api                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_api" "this" {

  name                         = ""     # string | required
  protocol_type                = ""     # string | required
  api_key_selection_expression = ""     # string | optional
  body                         = ""     # string | optional
  credentials_arn              = ""     # string | optional
  description                  = ""     # string | optional
  disable_execute_api_endpoint = false  # bool | optional
  fail_on_warnings             = false  # bool | optional
  id                           = ""     # string | optional+computed
  ip_address_type              = ""     # string | optional+computed
  route_key                    = ""     # string | optional
  route_selection_expression   = ""     # string | optional
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed
  target                       = ""     # string | optional
  version                      = ""     # string | optional

  # api_endpoint                 = ""     # string | computed
  # arn                          = ""     # string | computed
  # execution_arn                = ""     # string | computed

  cors_configuration { # list [0..1]
    allow_credentials = false  # bool | optional
    allow_headers     = []     # set(string) | optional
    allow_methods     = []     # set(string) | optional
    allow_origins     = []     # set(string) | optional
    expose_headers    = []     # set(string) | optional
    max_age           = 0      # number | optional

  }

}

