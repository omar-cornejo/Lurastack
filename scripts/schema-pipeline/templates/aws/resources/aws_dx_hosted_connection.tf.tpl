# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_hosted_connection                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_hosted_connection" "this" {

  bandwidth              = ""     # string | required
  connection_id          = ""     # string | required
  name                   = ""     # string | required
  owner_account_id       = ""     # string | required
  vlan                   = 0      # number | required
  id                     = ""     # string | optional+computed

  # aws_device             = ""     # string | computed
  # has_logical_redundancy = ""     # string | computed
  # jumbo_frame_capable    = false  # bool | computed
  # lag_id                 = ""     # string | computed
  # loa_issue_time         = ""     # string | computed
  # location               = ""     # string | computed
  # partner_name           = ""     # string | computed
  # provider_name          = ""     # string | computed
  # region                 = ""     # string | computed
  # state                  = ""     # string | computed

}

