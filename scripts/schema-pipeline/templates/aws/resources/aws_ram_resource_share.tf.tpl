# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ram_resource_share                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ram_resource_share" "this" {

  name                      = ""     # string | required
  allow_external_principals = false  # bool | optional
  id                        = ""     # string | optional+computed
  permission_arns           = []     # set(string) | optional+computed
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

