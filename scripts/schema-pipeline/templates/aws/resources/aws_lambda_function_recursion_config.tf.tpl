# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_function_recursion_config                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_function_recursion_config" "this" {

  function_name  = ""     # string | required
  recursive_loop = ""     # string | required

}

