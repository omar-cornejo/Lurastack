# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_components                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_components" "this" {

  id    = ""     # string | optional+computed
  owner = ""     # string | optional

  # arns  = []     # set(string) | computed
  # names = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

