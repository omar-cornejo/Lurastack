# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_invocation                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_invocation" "this" {

  function_name   = ""     # string | required
  input           = ""     # string | required
  id              = ""     # string | optional+computed
  lifecycle_scope = ""     # string | optional
  qualifier       = ""     # string | optional
  terraform_key   = ""     # string | optional
  triggers        = {}     # map(string) | optional

  # result          = ""     # string | computed

}

