# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_group_policy_attachment                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_group_policy_attachment" "this" {

  group      = ""     # string | required
  policy_arn = ""     # string | required
  id         = ""     # string | optional+computed

}

