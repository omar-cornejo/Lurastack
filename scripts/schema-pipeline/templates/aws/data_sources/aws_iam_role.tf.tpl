# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_role                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_role" "this" {

  name                 = ""     # string | required
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # assume_role_policy   = ""     # string | computed
  # create_date          = ""     # string | computed
  # description          = ""     # string | computed
  # max_session_duration = 0      # number | computed
  # path                 = ""     # string | computed
  # permissions_boundary = ""     # string | computed
  # role_last_used = [  # list(object)
  #   {
  #     last_used_date = ""
  #     region = ""
  #   }
  # ]
  # unique_id            = ""     # string | computed

}

