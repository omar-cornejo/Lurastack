# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_route                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_route" "this" {

  api_id                              = ""     # string | required
  route_key                           = ""     # string | required
  api_key_required                    = false  # bool | optional
  authorization_scopes                = []     # set(string) | optional
  authorization_type                  = ""     # string | optional
  authorizer_id                       = ""     # string | optional
  id                                  = ""     # string | optional+computed
  model_selection_expression          = ""     # string | optional
  operation_name                      = ""     # string | optional
  request_models                      = {}     # map(string) | optional
  route_response_selection_expression = ""     # string | optional
  target                              = ""     # string | optional

  request_parameter { # set
    request_parameter_key = ""     # string | required
    required              = false  # bool | required

  }

}

