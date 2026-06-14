# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_contributor_managed_insight_rule     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_contributor_managed_insight_rule" "this" {

  resource_arn  = ""     # string | required
  template_name = ""     # string | required
  state         = ""     # string | optional+computed
  tags          = {}     # map(string) | optional

  # arn           = ""     # string | computed
  # rule_name     = ""     # string | computed
  # tags_all      = {}     # map(string) | computed

}

