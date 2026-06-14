# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53recoveryreadiness_cell                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53recoveryreadiness_cell" "this" {

  cell_name               = ""     # string | required
  cells                   = []     # list(string) | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # parent_readiness_scopes = []     # list(string) | computed

  timeouts { # single
    delete = ""     # string | optional

  }

}

