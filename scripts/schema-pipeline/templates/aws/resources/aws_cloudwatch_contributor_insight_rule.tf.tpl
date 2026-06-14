# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_contributor_insight_rule             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_contributor_insight_rule" "this" {

  rule_definition = ""     # string | required
  rule_name       = ""     # string | required
  rule_state      = ""     # string | optional
  tags            = {}     # map(string) | optional

  # resource_arn    = ""     # string | computed
  # tags_all        = {}     # map(string) | computed

}

