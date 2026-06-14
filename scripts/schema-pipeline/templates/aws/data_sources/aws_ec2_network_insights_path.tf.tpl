# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_network_insights_path                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_network_insights_path" "this" {

  id                       = ""     # string | optional+computed
  network_insights_path_id = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # destination              = ""     # string | computed
  # destination_arn          = ""     # string | computed
  # destination_ip           = ""     # string | computed
  # destination_port         = 0      # number | computed
  # filter_at_destination = [  # list(object)
  #   {
  #     destination_address = ""
  #     destination_port_range = [  # list(object)
  #       {
  #         from_port = 0
  #         to_port = 0
  #       }
  #     ]
  #     source_address = ""
  #     source_port_range = [  # list(object)
  #       {
  #         from_port = 0
  #         to_port = 0
  #       }
  #     ]
  #   }
  # ]
  # filter_at_source = [  # list(object)
  #   {
  #     destination_address = ""
  #     destination_port_range = [  # list(object)
  #       {
  #         from_port = 0
  #         to_port = 0
  #       }
  #     ]
  #     source_address = ""
  #     source_port_range = [  # list(object)
  #       {
  #         from_port = 0
  #         to_port = 0
  #       }
  #     ]
  #   }
  # ]
  # protocol                 = ""     # string | computed
  # source                   = ""     # string | computed
  # source_arn               = ""     # string | computed
  # source_ip                = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

