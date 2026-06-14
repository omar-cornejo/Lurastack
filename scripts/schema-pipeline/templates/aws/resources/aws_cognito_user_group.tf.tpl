# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_user_group                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_user_group" "this" {

  name         = ""     # string | required
  user_pool_id = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  precedence   = 0      # number | optional
  role_arn     = ""     # string | optional

}

