# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_memorydb_parameter_group                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_memorydb_parameter_group" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed
  # family      = ""     # string | computed
  # parameter = [  # set(object)
  #   {
  #     name = ""
  #     value = ""
  #   }
  # ]

}

