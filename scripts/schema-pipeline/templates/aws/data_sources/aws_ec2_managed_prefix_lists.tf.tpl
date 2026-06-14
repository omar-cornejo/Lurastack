# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_managed_prefix_lists                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_managed_prefix_lists" "this" {

  id   = ""     # string | optional+computed
  tags = {}     # map(string) | optional+computed

  # ids  = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

