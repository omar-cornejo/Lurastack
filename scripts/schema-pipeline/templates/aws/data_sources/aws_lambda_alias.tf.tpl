# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lambda_alias                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_lambda_alias" "this" {

  function_name    = ""     # string | required
  name             = ""     # string | required
  id               = ""     # string | optional+computed

  # arn              = ""     # string | computed
  # description      = ""     # string | computed
  # function_version = ""     # string | computed
  # invoke_arn       = ""     # string | computed

}

