# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_sites                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_sites" "this" {

  global_network_id = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional

  # ids               = []     # list(string) | computed

}

