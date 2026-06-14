# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_medialive_input                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_medialive_input" "this" {

  id                  = ""     # string | required

  # arn                 = ""     # string | computed
  # attached_channels   = []     # list(string) | computed
  # destinations = [  # list(object)
  #   {
  #     ip = ""
  #     port = ""
  #     url = ""
  #     vpc = [  # list(object)
  #       {
  #         availability_zone = ""
  #         network_interface_id = ""
  #       }
  #     ]
  #   }
  # ]
  # input_class         = ""     # string | computed
  # input_devices = [  # list(object)
  #   {
  #     id = ""
  #   }
  # ]
  # input_partner_ids   = []     # list(string) | computed
  # input_source_type   = ""     # string | computed
  # media_connect_flows = [  # list(object)
  #   {
  #     flow_arn = ""
  #   }
  # ]
  # name                = ""     # string | computed
  # role_arn            = ""     # string | computed
  # security_groups     = []     # list(string) | computed
  # sources = [  # list(object)
  #   {
  #     password_param = ""
  #     url = ""
  #     username = ""
  #   }
  # ]
  # state               = ""     # string | computed
  # tags                = {}     # map(string) | computed
  # type                = ""     # string | computed

}

