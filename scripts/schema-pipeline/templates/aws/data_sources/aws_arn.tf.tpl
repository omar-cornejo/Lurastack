# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_arn                                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_arn" "this" {

  arn       = ""     # string | required
  id        = ""     # string | optional+computed

  # account   = ""     # string | computed
  # partition = ""     # string | computed
  # region    = ""     # string | computed
  # resource  = ""     # string | computed
  # service   = ""     # string | computed

}

