# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_user_group_membership                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_user_group_membership" "this" {

  groups = []     # set(string) | required
  user   = ""     # string | required
  id     = ""     # string | optional+computed

}

