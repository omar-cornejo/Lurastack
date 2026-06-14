# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_db_instances                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_db_instances" "this" {

  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional+computed

  # instance_arns        = []     # list(string) | computed
  # instance_identifiers = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

