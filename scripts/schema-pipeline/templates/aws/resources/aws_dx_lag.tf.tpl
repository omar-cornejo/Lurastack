# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_lag                                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_lag" "this" {

  connections_bandwidth  = ""     # string | required
  location               = ""     # string | required
  name                   = ""     # string | required
  connection_id          = ""     # string | optional
  force_destroy          = false  # bool | optional
  id                     = ""     # string | optional+computed
  provider_name          = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # has_logical_redundancy = ""     # string | computed
  # jumbo_frame_capable    = false  # bool | computed
  # owner_account_id       = ""     # string | computed

}

