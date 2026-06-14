# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_quicksight_user                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_quicksight_user" "this" {

  user_name      = ""     # string | required
  aws_account_id = ""     # string | optional+computed
  id             = ""     # string | optional+computed
  namespace      = ""     # string | optional

  # active         = false  # bool | computed
  # arn            = ""     # string | computed
  # email          = ""     # string | computed
  # identity_type  = ""     # string | computed
  # principal_id   = ""     # string | computed
  # user_role      = ""     # string | computed

}

