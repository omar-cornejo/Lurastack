# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_authorizer                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_authorizer" "this" {

  name                             = ""     # string | required
  rest_api_id                      = ""     # string | required
  authorizer_credentials           = ""     # string | optional
  authorizer_result_ttl_in_seconds = 0      # number | optional
  authorizer_uri                   = ""     # string | optional
  id                               = ""     # string | optional+computed
  identity_source                  = ""     # string | optional
  identity_validation_expression   = ""     # string | optional
  provider_arns                    = []     # set(string) | optional
  type                             = ""     # string | optional

  # arn                              = ""     # string | computed

}

