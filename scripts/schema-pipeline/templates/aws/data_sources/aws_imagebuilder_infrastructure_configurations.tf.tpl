# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_infrastructure_configurations          │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_infrastructure_configurations" "this" {

  id    = ""     # string | optional+computed

  # arns  = []     # set(string) | computed
  # names = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

