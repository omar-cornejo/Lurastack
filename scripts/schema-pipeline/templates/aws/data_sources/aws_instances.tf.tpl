# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_instances                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_instances" "this" {

  id                   = ""     # string | optional+computed
  instance_state_names = []     # set(string) | optional
  instance_tags        = {}     # map(string) | optional+computed

  # ids                  = []     # list(string) | computed
  # ipv6_addresses       = []     # list(string) | computed
  # private_ips          = []     # list(string) | computed
  # public_ips           = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

