# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_user_in_group                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_user_in_group" "this" {

  group_name   = ""     # string | required
  user_pool_id = ""     # string | required
  username     = ""     # string | required
  id           = ""     # string | optional+computed

}

