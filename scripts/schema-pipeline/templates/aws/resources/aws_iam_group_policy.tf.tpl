# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_group_policy                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_group_policy" "this" {

  group       = ""     # string | required
  policy      = ""     # string | required
  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  name_prefix = ""     # string | optional+computed

}

