# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_devices                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_devices" "this" {

  global_network_id = ""     # string | required
  id                = ""     # string | optional+computed
  site_id           = ""     # string | optional
  tags              = {}     # map(string) | optional

  # ids               = []     # list(string) | computed

}

