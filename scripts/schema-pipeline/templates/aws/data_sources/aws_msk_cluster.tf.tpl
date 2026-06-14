# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_msk_cluster                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_msk_cluster" "this" {

  cluster_name                        = ""     # string | required
  id                                  = ""     # string | optional+computed
  tags                                = {}     # map(string) | optional+computed

  # arn                                 = ""     # string | computed
  # bootstrap_brokers                   = ""     # string | computed
  # bootstrap_brokers_public_sasl_iam   = ""     # string | computed
  # bootstrap_brokers_public_sasl_scram = ""     # string | computed
  # bootstrap_brokers_public_tls        = ""     # string | computed
  # bootstrap_brokers_sasl_iam          = ""     # string | computed
  # bootstrap_brokers_sasl_scram        = ""     # string | computed
  # bootstrap_brokers_tls               = ""     # string | computed
  # broker_node_group_info = [  # list(object)
  #   {
  #     az_distribution = ""
  #     client_subnets = []  # set(string)
  #     connectivity_info = [  # list(object)
  #       {
  #         public_access = [  # list(object)
  #           {
  #             type = ""
  #           }
  #         ]
  #         vpc_connectivity = [  # list(object)
  #           {
  #             client_authentication = [  # list(object)
  #               {
  #                 sasl = [  # list(object)
  #                   {
  #                     iam = false
  #                     scram = false
  #                   }
  #                 ]
  #                 tls = false
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     instance_type = ""
  #     security_groups = []  # set(string)
  #     storage_info = [  # list(object)
  #       {
  #         ebs_storage_info = [  # list(object)
  #           {
  #             provisioned_throughput = [  # list(object)
  #               {
  #                 enabled = false
  #                 volume_throughput = 0
  #               }
  #             ]
  #             volume_size = 0
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # cluster_uuid                        = ""     # string | computed
  # kafka_version                       = ""     # string | computed
  # number_of_broker_nodes              = 0      # number | computed
  # zookeeper_connect_string            = ""     # string | computed
  # zookeeper_connect_string_tls        = ""     # string | computed

}

