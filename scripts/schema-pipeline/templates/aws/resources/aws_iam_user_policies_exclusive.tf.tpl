# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_user_policies_exclusive                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_user_policies_exclusive" "this" {

  policy_names = []     # set(string) | required
  user_name    = ""     # string | required

}

