# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_athena_capacity_reservation                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_athena_capacity_reservation" "this" {

  name           = ""     # string | required
  target_dpus    = 0      # number | required
  tags           = {}     # map(string) | optional

  # allocated_dpus = 0      # number | computed
  # arn            = ""     # string | computed
  # status         = ""     # string | computed
  # tags_all       = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

