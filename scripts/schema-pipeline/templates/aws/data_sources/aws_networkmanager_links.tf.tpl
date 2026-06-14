# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_links                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_links" "this" {

  global_network_id = ""     # string | required
  id                = ""     # string | optional+computed
  provider_name     = ""     # string | optional
  site_id           = ""     # string | optional
  tags              = {}     # map(string) | optional
  type              = ""     # string | optional

  # ids               = []     # list(string) | computed

}

