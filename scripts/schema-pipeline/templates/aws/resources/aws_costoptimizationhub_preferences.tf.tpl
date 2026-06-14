# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_costoptimizationhub_preferences                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_costoptimizationhub_preferences" "this" {

  member_account_discount_visibility = ""     # string | optional+computed
  savings_estimation_mode            = ""     # string | optional+computed

  # id                                 = ""     # string | computed

}

