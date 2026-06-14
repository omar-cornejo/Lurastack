# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_prefix_list                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_prefix_list" "this" {

  id             = ""     # string | optional+computed
  name           = ""     # string | optional+computed
  prefix_list_id = ""     # string | optional

  # cidr_blocks    = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

