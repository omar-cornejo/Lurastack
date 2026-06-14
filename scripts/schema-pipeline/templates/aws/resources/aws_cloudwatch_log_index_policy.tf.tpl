# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_index_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_index_policy" "this" {

  log_group_name  = ""     # string | required
  policy_document = ""     # string | required | Field index filter policy, in JSON

}

