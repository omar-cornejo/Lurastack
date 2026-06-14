# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_apigatewayv2_api                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_apigatewayv2_api" "this" {

  api_id                       = ""     # string | required
  id                           = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional+computed

  # api_endpoint                 = ""     # string | computed
  # api_key_selection_expression = ""     # string | computed
  # arn                          = ""     # string | computed
  # cors_configuration = [  # list(object)
  #   {
  #     allow_credentials = false
  #     allow_headers = []  # set(string)
  #     allow_methods = []  # set(string)
  #     allow_origins = []  # set(string)
  #     expose_headers = []  # set(string)
  #     max_age = 0
  #   }
  # ]
  # description                  = ""     # string | computed
  # disable_execute_api_endpoint = false  # bool | computed
  # execution_arn                = ""     # string | computed
  # ip_address_type              = ""     # string | computed
  # name                         = ""     # string | computed
  # protocol_type                = ""     # string | computed
  # route_selection_expression   = ""     # string | computed
  # version                      = ""     # string | computed

}

