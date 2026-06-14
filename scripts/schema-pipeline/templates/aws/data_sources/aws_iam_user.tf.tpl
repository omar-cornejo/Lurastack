# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_user                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_user" "this" {

  user_name            = ""     # string | required
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # path                 = ""     # string | computed
  # permissions_boundary = ""     # string | computed
  # user_id              = ""     # string | computed

}

