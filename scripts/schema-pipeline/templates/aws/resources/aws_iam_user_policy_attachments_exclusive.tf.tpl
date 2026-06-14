# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_user_policy_attachments_exclusive           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_user_policy_attachments_exclusive" "this" {

  policy_arns = []     # set(string) | required
  user_name   = ""     # string | required

}

