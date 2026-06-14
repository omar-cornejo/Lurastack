# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_role_policy_attachments_exclusive           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_role_policy_attachments_exclusive" "this" {

  policy_arns = []     # set(string) | required
  role_name   = ""     # string | required

}

