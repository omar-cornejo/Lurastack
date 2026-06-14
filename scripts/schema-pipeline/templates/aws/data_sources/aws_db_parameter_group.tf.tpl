# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_db_parameter_group                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_db_parameter_group" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed
  # family      = ""     # string | computed

}

