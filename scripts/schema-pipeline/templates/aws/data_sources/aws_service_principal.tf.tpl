# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_service_principal                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_service_principal" "this" {

  service_name = ""     # string | required
  region       = ""     # string | optional+computed

  # id           = ""     # string | computed
  # name         = ""     # string | computed
  # suffix       = ""     # string | computed

}

