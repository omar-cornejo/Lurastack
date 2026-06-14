# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_product_subscription                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_product_subscription" "this" {

  product_arn = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed

}

