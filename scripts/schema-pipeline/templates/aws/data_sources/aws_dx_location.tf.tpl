# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dx_location                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_dx_location" "this" {

  location_code                = ""     # string | required
  id                           = ""     # string | optional+computed

  # available_macsec_port_speeds = []     # list(string) | computed
  # available_port_speeds        = []     # list(string) | computed
  # available_providers          = []     # list(string) | computed
  # location_name                = ""     # string | computed

}

