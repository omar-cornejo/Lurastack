# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_user                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_user" "this" {

  email               = ""     # string | required
  identity_type       = ""     # string | required
  user_role           = ""     # string | required
  aws_account_id      = ""     # string | optional+computed
  iam_arn             = ""     # string | optional
  id                  = ""     # string | optional+computed
  namespace           = ""     # string | optional
  session_name        = ""     # string | optional
  user_name           = ""     # string | optional

  # arn                 = ""     # string | computed
  # user_invitation_url = ""     # string | computed

}

