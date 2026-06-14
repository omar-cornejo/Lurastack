# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_device                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_device" "this" {

  global_network_id = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  model             = ""     # string | optional
  serial_number     = ""     # string | optional
  site_id           = ""     # string | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  type              = ""     # string | optional
  vendor            = ""     # string | optional

  # arn               = ""     # string | computed

  aws_location { # list [0..1]
    subnet_arn = ""     # string | optional
    zone       = ""     # string | optional

  }

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

