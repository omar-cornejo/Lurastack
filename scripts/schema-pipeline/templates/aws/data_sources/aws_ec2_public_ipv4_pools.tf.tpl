# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_public_ipv4_pools                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_public_ipv4_pools" "this" {

  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional+computed

  # pool_ids = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

