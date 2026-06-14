# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_group_membership                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_group_membership" "this" {

  group = ""     # string | required
  name  = ""     # string | required
  users = []     # set(string) | required
  id    = ""     # string | optional+computed

}

