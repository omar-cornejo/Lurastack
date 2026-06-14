# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_redshiftserverless_workgroup                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_redshiftserverless_workgroup" "this" {

  workgroup_name       = ""     # string | required
  id                   = ""     # string | optional+computed

  # arn                  = ""     # string | computed
  # endpoint = [  # list(object)
  #   {
  #     address = ""
  #     port = 0
  #     vpc_endpoint = [  # list(object)
  #       {
  #         network_interface = [  # list(object)
  #           {
  #             availability_zone = ""
  #             network_interface_id = ""
  #             private_ip_address = ""
  #             subnet_id = ""
  #           }
  #         ]
  #         vpc_endpoint_id = ""
  #         vpc_id = ""
  #       }
  #     ]
  #   }
  # ]
  # enhanced_vpc_routing = false  # bool | computed
  # namespace_name       = ""     # string | computed
  # publicly_accessible  = false  # bool | computed
  # security_group_ids   = []     # set(string) | computed
  # subnet_ids           = []     # set(string) | computed
  # track_name           = ""     # string | computed
  # workgroup_id         = ""     # string | computed

}

