# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_authorizer                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_authorizer" "this" {

  authorizer_function_arn   = ""     # string | required
  name                      = ""     # string | required
  enable_caching_for_http   = false  # bool | optional
  id                        = ""     # string | optional+computed
  signing_disabled          = false  # bool | optional
  status                    = ""     # string | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed
  token_key_name            = ""     # string | optional
  token_signing_public_keys = {}     # map(string) | optional+sensitive

  # arn                       = ""     # string | computed

}

