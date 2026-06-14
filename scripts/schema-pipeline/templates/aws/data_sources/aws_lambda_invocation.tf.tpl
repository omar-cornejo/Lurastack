# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lambda_invocation                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_lambda_invocation" "this" {

  function_name = ""     # string | required
  input         = ""     # string | required
  id            = ""     # string | optional+computed
  qualifier     = ""     # string | optional

  # result        = ""     # string | computed

}

