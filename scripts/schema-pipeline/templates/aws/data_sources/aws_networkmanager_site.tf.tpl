# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_site                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_site" "this" {

  global_network_id = ""     # string | required
  site_id           = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # description       = ""     # string | computed
  # location = [  # list(object)
  #   {
  #     address = ""
  #     latitude = ""
  #     longitude = ""
  #   }
  # ]

}

