# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dx_connection                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_dx_connection" "this" {

  name             = ""     # string | required
  id               = ""     # string | optional+computed
  tags             = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # aws_device       = ""     # string | computed
  # bandwidth        = ""     # string | computed
  # location         = ""     # string | computed
  # owner_account_id = ""     # string | computed
  # partner_name     = ""     # string | computed
  # provider_name    = ""     # string | computed
  # state            = ""     # string | computed
  # vlan_id          = 0      # number | computed

}

