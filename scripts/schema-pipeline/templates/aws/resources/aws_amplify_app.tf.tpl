# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_amplify_app                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_amplify_app" "this" {

  name                          = ""     # string | required
  access_token                  = ""     # string | optional+sensitive
  auto_branch_creation_patterns = []     # set(string) | optional
  basic_auth_credentials        = ""     # string | optional+sensitive
  build_spec                    = ""     # string | optional+computed
  compute_role_arn              = ""     # string | optional
  custom_headers                = ""     # string | optional+computed
  description                   = ""     # string | optional
  enable_auto_branch_creation   = false  # bool | optional
  enable_basic_auth             = false  # bool | optional
  enable_branch_auto_build      = false  # bool | optional
  enable_branch_auto_deletion   = false  # bool | optional
  environment_variables         = {}     # map(string) | optional
  iam_service_role_arn          = ""     # string | optional
  id                            = ""     # string | optional+computed
  oauth_token                   = ""     # string | optional+sensitive
  platform                      = ""     # string | optional
  repository                    = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed
  # default_domain                = ""     # string | computed
  # production_branch = [  # list(object)
  #   {
  #     branch_name = ""
  #     last_deploy_time = ""
  #     status = ""
  #     thumbnail_url = ""
  #   }
  # ]

  auto_branch_creation_config { # list [0..1]
    basic_auth_credentials        = ""     # string | optional+sensitive
    build_spec                    = ""     # string | optional
    enable_auto_build             = false  # bool | optional
    enable_basic_auth             = false  # bool | optional
    enable_performance_mode       = false  # bool | optional
    enable_pull_request_preview   = false  # bool | optional
    environment_variables         = {}     # map(string) | optional
    framework                     = ""     # string | optional
    pull_request_environment_name = ""     # string | optional
    stage                         = ""     # string | optional

  }

  cache_config { # list [0..1]
    type = ""     # string | required

  }

  custom_rule { # list
    source    = ""     # string | required
    target    = ""     # string | required
    condition = ""     # string | optional
    status    = ""     # string | optional

  }

}

