# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_receipt_filter                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_receipt_filter" "this" {

  cidr   = ""     # string | required
  name   = ""     # string | required
  policy = ""     # string | required
  id     = ""     # string | optional+computed

  # arn    = ""     # string | computed

}

