# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_availability_zones                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_availability_zones" "this" {

  all_availability_zones = false  # bool | optional
  exclude_names          = []     # set(string) | optional
  exclude_zone_ids       = []     # set(string) | optional
  id                     = ""     # string | optional+computed
  state                  = ""     # string | optional

  # group_names            = []     # set(string) | computed
  # names                  = []     # list(string) | computed
  # zone_ids               = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

