# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_role_policy                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_role_policy" "this" {

  policy      = ""     # string | required
  role        = ""     # string | required
  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  name_prefix = ""     # string | optional+computed

}

