# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_deployment                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_deployment" "this" {

  rest_api_id       = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  stage_description = ""     # string | optional+DEPRECATED
  stage_name        = ""     # string | optional+DEPRECATED
  triggers          = {}     # map(string) | optional
  variables         = {}     # map(string) | optional

  # created_date      = ""     # string | computed
  # execution_arn     = ""     # string | computed+DEPRECATED
  # invoke_url        = ""     # string | computed+DEPRECATED

  canary_settings { # list [0..1] DEPRECATED
    percent_traffic          = 0      # number | optional
    stage_variable_overrides = {}     # map(string) | optional
    use_stage_cache          = false  # bool | optional

  }

}

