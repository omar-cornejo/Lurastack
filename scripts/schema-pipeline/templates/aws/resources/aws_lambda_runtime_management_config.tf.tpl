# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_runtime_management_config                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_runtime_management_config" "this" {

  function_name       = ""     # string | required
  qualifier           = ""     # string | optional
  runtime_version_arn = ""     # string | optional
  update_runtime_on   = ""     # string | optional

  # function_arn        = ""     # string | computed

}

