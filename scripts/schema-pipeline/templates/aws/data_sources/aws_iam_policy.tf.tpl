# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_policy                                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_policy" "this" {

  arn              = ""     # string | optional+computed
  id               = ""     # string | optional+computed
  name             = ""     # string | optional+computed
  path_prefix      = ""     # string | optional
  tags             = {}     # map(string) | optional+computed

  # attachment_count = 0      # number | computed
  # description      = ""     # string | computed
  # path             = ""     # string | computed
  # policy           = ""     # string | computed
  # policy_id        = ""     # string | computed

}

