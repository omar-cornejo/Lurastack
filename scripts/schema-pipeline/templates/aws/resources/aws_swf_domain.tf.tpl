# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_swf_domain                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_swf_domain" "this" {

  workflow_execution_retention_period_in_days = ""     # string | required
  description                                 = ""     # string | optional
  id                                          = ""     # string | optional+computed
  name                                        = ""     # string | optional+computed
  name_prefix                                 = ""     # string | optional+computed
  tags                                        = {}     # map(string) | optional
  tags_all                                    = {}     # map(string) | optional+computed

  # arn                                         = ""     # string | computed

}

