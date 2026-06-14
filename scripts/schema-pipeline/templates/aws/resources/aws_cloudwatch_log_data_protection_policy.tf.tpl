# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_data_protection_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_data_protection_policy" "this" {

  log_group_name  = ""     # string | required
  policy_document = ""     # string | required
  id              = ""     # string | optional+computed

}

