# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dax_parameter_group                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dax_parameter_group" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed

  parameters { # set
    name  = ""     # string | required
    value = ""     # string | required

  }

}

