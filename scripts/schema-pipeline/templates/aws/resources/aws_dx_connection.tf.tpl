# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_connection                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_connection" "this" {

  bandwidth              = ""     # string | required
  location               = ""     # string | required
  name                   = ""     # string | required
  encryption_mode        = ""     # string | optional+computed
  id                     = ""     # string | optional+computed
  provider_name          = ""     # string | optional+computed
  request_macsec         = false  # bool | optional
  skip_destroy           = false  # bool | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # aws_device             = ""     # string | computed
  # has_logical_redundancy = ""     # string | computed
  # jumbo_frame_capable    = false  # bool | computed
  # macsec_capable         = false  # bool | computed
  # owner_account_id       = ""     # string | computed
  # partner_name           = ""     # string | computed
  # port_encryption_status = ""     # string | computed
  # vlan_id                = 0      # number | computed

}

