# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_group_policies_exclusive                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_group_policies_exclusive" "this" {

  group_name   = ""     # string | required
  policy_names = []     # set(string) | required

}

