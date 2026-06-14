# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_group                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_group" "this" {

  group_name = ""     # string | required
  id         = ""     # string | optional+computed

  # arn        = ""     # string | computed
  # group_id   = ""     # string | computed
  # path       = ""     # string | computed
  # users = [  # list(object)
  #   {
  #     arn = ""
  #     path = ""
  #     user_id = ""
  #     user_name = ""
  #   }
  # ]

}

