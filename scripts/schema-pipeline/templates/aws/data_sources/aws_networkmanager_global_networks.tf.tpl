# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_global_networks                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_global_networks" "this" {

  id   = ""     # string | optional+computed
  tags = {}     # map(string) | optional

  # ids  = []     # list(string) | computed

}

