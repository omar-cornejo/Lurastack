# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_autoscaling_groups                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_autoscaling_groups" "this" {

  id    = ""     # string | optional+computed
  names = []     # list(string) | optional+computed

  # arns  = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

}

