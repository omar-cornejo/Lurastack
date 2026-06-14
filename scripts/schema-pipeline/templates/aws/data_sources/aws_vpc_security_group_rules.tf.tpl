# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_security_group_rules                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_security_group_rules" "this" {

  tags = {}     # map(string) | optional

  # id   = ""     # string | computed
  # ids  = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

