# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_policy_attachment                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_policy_attachment" "this" {

  name       = ""     # string | required
  policy_arn = ""     # string | required
  groups     = []     # set(string) | optional
  id         = ""     # string | optional+computed
  roles      = []     # set(string) | optional
  users      = []     # set(string) | optional

}

