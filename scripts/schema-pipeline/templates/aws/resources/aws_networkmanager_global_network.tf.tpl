# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_global_network                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_global_network" "this" {

  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

