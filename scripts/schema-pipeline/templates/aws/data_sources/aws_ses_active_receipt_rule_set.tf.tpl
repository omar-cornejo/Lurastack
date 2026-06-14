# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ses_active_receipt_rule_set                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ses_active_receipt_rule_set" "this" {

  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # rule_set_name = ""     # string | computed

}

