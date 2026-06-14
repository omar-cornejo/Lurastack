# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_account_suppression_attributes            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_account_suppression_attributes" "this" {

  suppressed_reasons = []     # set(string) | required

  # id                 = ""     # string | computed

}

