# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cognito_user_group                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_cognito_user_group" "this" {

  name         = ""     # string | required
  user_pool_id = ""     # string | required

  # description  = ""     # string | computed
  # id           = ""     # string | computed
  # precedence   = 0      # number | computed
  # role_arn     = ""     # string | computed

}

