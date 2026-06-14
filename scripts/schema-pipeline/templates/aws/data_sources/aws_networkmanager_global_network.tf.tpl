# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_global_network                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_global_network" "this" {

  global_network_id = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # description       = ""     # string | computed

}

