# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_connections                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_connections" "this" {

  global_network_id = ""     # string | required
  device_id         = ""     # string | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional

  # ids               = []     # list(string) | computed

}

