# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_account_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_account_policy" "this" {

  policy_document    = ""     # string | required
  policy_name        = ""     # string | required
  policy_type        = ""     # string | required
  id                 = ""     # string | optional+computed
  scope              = ""     # string | optional
  selection_criteria = ""     # string | optional

}

