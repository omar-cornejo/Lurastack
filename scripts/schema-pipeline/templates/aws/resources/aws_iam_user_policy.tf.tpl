# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_user_policy                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_user_policy" "this" {

  policy      = ""     # string | required
  user        = ""     # string | required
  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  name_prefix = ""     # string | optional+computed

}

