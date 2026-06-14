# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_container_recipes                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_container_recipes" "this" {

  id    = ""     # string | optional+computed
  owner = ""     # string | optional

  # arns  = []     # set(string) | computed
  # names = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

