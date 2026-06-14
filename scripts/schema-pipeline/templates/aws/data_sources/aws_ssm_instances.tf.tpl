# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssm_instances                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssm_instances" "this" {

  id  = ""     # string | optional+computed

  # ids = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

}

