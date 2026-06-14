# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_provisioned_concurrency_config           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_provisioned_concurrency_config" "this" {

  function_name                     = ""     # string | required
  provisioned_concurrent_executions = 0      # number | required
  qualifier                         = ""     # string | required
  id                                = ""     # string | optional+computed
  skip_destroy                      = false  # bool | optional

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

