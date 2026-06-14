# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_receipt_rule_set                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_receipt_rule_set" "this" {

  rule_set_name = ""     # string | required
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed

}

