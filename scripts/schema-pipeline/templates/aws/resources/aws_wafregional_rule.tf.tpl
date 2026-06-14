# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafregional_rule                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafregional_rule" "this" {

  metric_name = ""     # string | required
  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  predicate { # set
    data_id = ""     # string | required
    negated = false  # bool | required
    type    = ""     # string | required

  }

}

