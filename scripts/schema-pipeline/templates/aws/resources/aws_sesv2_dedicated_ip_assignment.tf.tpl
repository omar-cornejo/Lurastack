# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_dedicated_ip_assignment                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_dedicated_ip_assignment" "this" {

  destination_pool_name = ""     # string | required
  ip                    = ""     # string | required
  id                    = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

