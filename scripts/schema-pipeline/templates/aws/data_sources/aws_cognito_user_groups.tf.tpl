# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cognito_user_groups                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_cognito_user_groups" "this" {

  user_pool_id = ""     # string | required

  # groups = [  # list(object)
  #   {
  #     description = ""
  #     group_name = ""
  #     precedence = 0
  #     role_arn = ""
  #   }
  # ]
  # id           = ""     # string | computed

}

