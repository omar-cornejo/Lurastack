# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_resource_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_resource_policy" "this" {

  policy_document = ""     # string | required
  policy_name     = ""     # string | required
  id              = ""     # string | optional+computed

}

