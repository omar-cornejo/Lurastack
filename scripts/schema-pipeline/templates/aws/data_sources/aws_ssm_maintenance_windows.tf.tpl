# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssm_maintenance_windows                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssm_maintenance_windows" "this" {

  id  = ""     # string | optional+computed

  # ids = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

}

