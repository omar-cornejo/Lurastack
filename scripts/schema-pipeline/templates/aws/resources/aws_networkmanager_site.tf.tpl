# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_site                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_site" "this" {

  global_network_id = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed

  location { # list [0..1]
    address   = ""     # string | optional
    latitude  = ""     # string | optional
    longitude = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

