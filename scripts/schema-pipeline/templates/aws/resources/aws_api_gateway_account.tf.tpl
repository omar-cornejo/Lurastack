# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_account                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_account" "this" {

  cloudwatch_role_arn = ""     # string | optional+computed
  reset_on_delete     = false  # bool | optional+DEPRECATED

  # api_key_version     = ""     # string | computed
  # features            = []     # set(string) | computed
  # id                  = ""     # string | computed+DEPRECATED
  # throttle_settings = [  # list(object)
  #   {
  #     burst_limit = 0
  #     rate_limit = 0
  #   }
  # ]

}

