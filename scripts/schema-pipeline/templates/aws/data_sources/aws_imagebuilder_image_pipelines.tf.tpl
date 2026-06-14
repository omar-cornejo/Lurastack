# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_image_pipelines                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_image_pipelines" "this" {

  id    = ""     # string | optional+computed

  # arns  = []     # set(string) | computed
  # names = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

