# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_file_system_association          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_file_system_association" "this" {

  gateway_arn           = ""     # string | required
  location_arn          = ""     # string | required
  password              = ""     # string | required+sensitive
  username              = ""     # string | required
  audit_destination_arn = ""     # string | optional
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed

  cache_attributes { # list [0..1]
    cache_stale_timeout_in_seconds = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

