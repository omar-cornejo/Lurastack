# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_amplify_backend_environment                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_amplify_backend_environment" "this" {

  app_id               = ""     # string | required
  environment_name     = ""     # string | required
  deployment_artifacts = ""     # string | optional+computed
  id                   = ""     # string | optional+computed
  stack_name           = ""     # string | optional+computed

  # arn                  = ""     # string | computed

}

