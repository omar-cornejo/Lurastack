# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ram_resource_share                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ram_resource_share" "this" {

  resource_owner        = ""     # string | required
  id                    = ""     # string | optional+computed
  name                  = ""     # string | optional+computed
  resource_share_status = ""     # string | optional
  tags                  = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # owning_account_id     = ""     # string | computed
  # resource_arns         = []     # list(string) | computed
  # status                = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

}

