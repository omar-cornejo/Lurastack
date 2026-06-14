# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpclattice_resource_policy                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpclattice_resource_policy" "this" {

  resource_arn = ""     # string | required
  id           = ""     # string | optional+computed

  # policy       = ""     # string | computed

}

