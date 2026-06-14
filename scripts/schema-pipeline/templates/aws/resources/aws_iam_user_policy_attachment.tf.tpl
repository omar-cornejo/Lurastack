# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_user_policy_attachment                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_user_policy_attachment" "this" {

  policy_arn = ""     # string | required
  user       = ""     # string | required
  id         = ""     # string | optional+computed

}

