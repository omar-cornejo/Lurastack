# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_role_policies_exclusive                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_role_policies_exclusive" "this" {

  policy_names = []     # set(string) | required
  role_name    = ""     # string | required

}

