# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_costoptimizationhub_enrollment_status           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_costoptimizationhub_enrollment_status" "this" {

  include_member_accounts = false  # bool | optional+computed

  # id                      = ""     # string | computed
  # status                  = ""     # string | computed

}

