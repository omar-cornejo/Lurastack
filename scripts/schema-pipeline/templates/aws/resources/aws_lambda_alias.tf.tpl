# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_alias                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_alias" "this" {

  function_name    = ""     # string | required
  function_version = ""     # string | required
  name             = ""     # string | required
  description      = ""     # string | optional
  id               = ""     # string | optional+computed

  # arn              = ""     # string | computed
  # invoke_arn       = ""     # string | computed

  routing_config { # list [0..1]
    additional_version_weights = {}     # map(number) | optional

  }

}

