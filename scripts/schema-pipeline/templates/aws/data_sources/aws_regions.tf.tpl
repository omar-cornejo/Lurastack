# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_regions                                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_regions" "this" {

  all_regions = false  # bool | optional
  id          = ""     # string | optional+computed

  # names       = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

