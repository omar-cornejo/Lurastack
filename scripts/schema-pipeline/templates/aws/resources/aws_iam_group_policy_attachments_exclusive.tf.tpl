# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_group_policy_attachments_exclusive          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_group_policy_attachments_exclusive" "this" {

  group_name  = ""     # string | required
  policy_arns = []     # set(string) | required

}

