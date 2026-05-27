# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_availability_zone                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_availability_zone" "this" {

  all_availability_zones = false  # bool | optional
  id                     = ""     # string | optional+computed
  name                   = ""     # string | optional+computed
  state                  = ""     # string | optional+computed
  zone_id                = ""     # string | optional+computed

  # group_name             = ""     # string | computed
  # name_suffix            = ""     # string | computed
  # network_border_group   = ""     # string | computed
  # opt_in_status          = ""     # string | computed
  # parent_zone_id         = ""     # string | computed
  # parent_zone_name       = ""     # string | computed
  # region                 = ""     # string | computed
  # zone_type              = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

