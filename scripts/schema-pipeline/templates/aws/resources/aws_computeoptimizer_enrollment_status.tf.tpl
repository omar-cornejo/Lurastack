# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_computeoptimizer_enrollment_status              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_computeoptimizer_enrollment_status" "this" {

  status                             = ""     # string | required
  include_member_accounts            = false  # bool | optional+computed

  # id                                 = ""     # string | computed
  # number_of_member_accounts_opted_in = 0      # number | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

