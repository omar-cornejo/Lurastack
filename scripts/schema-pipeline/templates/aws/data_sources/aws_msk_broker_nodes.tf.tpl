# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_msk_broker_nodes                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_msk_broker_nodes" "this" {

  cluster_arn    = ""     # string | required
  id             = ""     # string | optional+computed

  # node_info_list = [  # list(object)
  #   {
  #     attached_eni_id = ""
  #     broker_id = 0
  #     client_subnet = ""
  #     client_vpc_ip_address = ""
  #     endpoints = []  # set(string)
  #     node_arn = ""
  #   }
  # ]

}

