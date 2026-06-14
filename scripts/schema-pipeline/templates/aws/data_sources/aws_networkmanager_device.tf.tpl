# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_device                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_device" "this" {

  device_id         = ""     # string | required
  global_network_id = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # aws_location = [  # list(object)
  #   {
  #     subnet_arn = ""
  #     zone = ""
  #   }
  # ]
  # description       = ""     # string | computed
  # location = [  # list(object)
  #   {
  #     address = ""
  #     latitude = ""
  #     longitude = ""
  #   }
  # ]
  # model             = ""     # string | computed
  # serial_number     = ""     # string | computed
  # site_id           = ""     # string | computed
  # type              = ""     # string | computed
  # vendor            = ""     # string | computed

}

