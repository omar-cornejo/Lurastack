# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_amplify_branch                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_amplify_branch" "this" {

  app_id                        = ""     # string | required
  branch_name                   = ""     # string | required
  backend_environment_arn       = ""     # string | optional
  basic_auth_credentials        = ""     # string | optional+sensitive
  description                   = ""     # string | optional
  display_name                  = ""     # string | optional+computed
  enable_auto_build             = false  # bool | optional
  enable_basic_auth             = false  # bool | optional
  enable_notification           = false  # bool | optional
  enable_performance_mode       = false  # bool | optional
  enable_pull_request_preview   = false  # bool | optional
  environment_variables         = {}     # map(string) | optional
  framework                     = ""     # string | optional
  id                            = ""     # string | optional+computed
  pull_request_environment_name = ""     # string | optional
  stage                         = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  ttl                           = ""     # string | optional

  # arn                           = ""     # string | computed
  # associated_resources          = []     # list(string) | computed
  # custom_domains                = []     # list(string) | computed
  # destination_branch            = ""     # string | computed
  # source_branch                 = ""     # string | computed

}

