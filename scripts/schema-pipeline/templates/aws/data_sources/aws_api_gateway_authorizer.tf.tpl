# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_authorizer                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_authorizer" "this" {

  authorizer_id                    = ""     # string | required
  rest_api_id                      = ""     # string | required
  id                               = ""     # string | optional+computed

  # arn                              = ""     # string | computed
  # authorizer_credentials           = ""     # string | computed
  # authorizer_result_ttl_in_seconds = 0      # number | computed
  # authorizer_uri                   = ""     # string | computed
  # identity_source                  = ""     # string | computed
  # identity_validation_expression   = ""     # string | computed
  # name                             = ""     # string | computed
  # provider_arns                    = []     # list(string) | computed
  # type                             = ""     # string | computed

}

