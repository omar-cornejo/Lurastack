# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_region                                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_region" "this" {

  endpoint    = ""     # string | optional+computed
  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed

  # description = ""     # string | computed

}

