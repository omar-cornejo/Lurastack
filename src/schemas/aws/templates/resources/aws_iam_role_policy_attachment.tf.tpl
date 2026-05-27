# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_role_policy_attachment                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_role_policy_attachment" "this" {

  policy_arn = ""     # string | required
  role       = ""     # string | required
  id         = ""     # string | optional+computed

}

