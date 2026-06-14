# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_connection                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_connection" "this" {

  connection_id       = ""     # string | required
  global_network_id   = ""     # string | required
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # connected_device_id = ""     # string | computed
  # connected_link_id   = ""     # string | computed
  # description         = ""     # string | computed
  # device_id           = ""     # string | computed
  # link_id             = ""     # string | computed

}

