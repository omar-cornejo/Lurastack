# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_apigatewayv2_export                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_apigatewayv2_export" "this" {

  api_id             = ""     # string | required
  output_type        = ""     # string | required
  specification      = ""     # string | required
  export_version     = ""     # string | optional
  id                 = ""     # string | optional+computed
  include_extensions = false  # bool | optional
  stage_name         = ""     # string | optional

  # body               = ""     # string | computed

}

