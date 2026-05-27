# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_policy                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_policy" "this" {

  policy           = ""     # string | required
  description      = ""     # string | optional
  id               = ""     # string | optional+computed
  name             = ""     # string | optional+computed
  name_prefix      = ""     # string | optional+computed
  path             = ""     # string | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # attachment_count = 0      # number | computed
  # policy_id        = ""     # string | computed

}

