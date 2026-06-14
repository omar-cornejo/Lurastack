# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_lambda_function_association                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_lambda_function_association" "this" {

  function_arn = ""     # string | required
  instance_id  = ""     # string | required
  id           = ""     # string | optional+computed

}

