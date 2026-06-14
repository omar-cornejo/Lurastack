# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_link                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_link" "this" {

  global_network_id = ""     # string | required
  site_id           = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  provider_name     = ""     # string | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  type              = ""     # string | optional

  # arn               = ""     # string | computed

  bandwidth { # list [1..1]
    download_speed = 0      # number | optional
    upload_speed   = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

