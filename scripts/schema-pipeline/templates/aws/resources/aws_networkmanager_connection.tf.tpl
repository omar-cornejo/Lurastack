# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_connection                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_connection" "this" {

  connected_device_id = ""     # string | required
  device_id           = ""     # string | required
  global_network_id   = ""     # string | required
  connected_link_id   = ""     # string | optional
  description         = ""     # string | optional
  id                  = ""     # string | optional+computed
  link_id             = ""     # string | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

