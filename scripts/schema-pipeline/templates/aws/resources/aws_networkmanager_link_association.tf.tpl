# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_link_association                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_link_association" "this" {

  device_id         = ""     # string | required
  global_network_id = ""     # string | required
  link_id           = ""     # string | required
  id                = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

