# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_memorydb_cluster                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_memorydb_cluster" "this" {

  name                       = ""     # string | required
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional+computed

  # acl_name                   = ""     # string | computed
  # arn                        = ""     # string | computed
  # auto_minor_version_upgrade = false  # bool | computed
  # cluster_endpoint = [  # list(object)
  #   {
  #     address = ""
  #     port = 0
  #   }
  # ]
  # data_tiering               = false  # bool | computed
  # description                = ""     # string | computed
  # engine                     = ""     # string | computed
  # engine_patch_version       = ""     # string | computed
  # engine_version             = ""     # string | computed
  # final_snapshot_name        = ""     # string | computed
  # kms_key_arn                = ""     # string | computed
  # maintenance_window         = ""     # string | computed
  # node_type                  = ""     # string | computed
  # num_replicas_per_shard     = 0      # number | computed
  # num_shards                 = 0      # number | computed
  # parameter_group_name       = ""     # string | computed
  # port                       = 0      # number | computed
  # security_group_ids         = []     # set(string) | computed
  # shards = [  # set(object)
  #   {
  #     name = ""
  #     nodes = [  # set(object)
  #       {
  #         availability_zone = ""
  #         create_time = ""
  #         endpoint = [  # list(object)
  #           {
  #             address = ""
  #             port = 0
  #           }
  #         ]
  #         name = ""
  #       }
  #     ]
  #     num_nodes = 0
  #     slots = ""
  #   }
  # ]
  # snapshot_retention_limit   = 0      # number | computed
  # snapshot_window            = ""     # string | computed
  # sns_topic_arn              = ""     # string | computed
  # subnet_group_name          = ""     # string | computed
  # tls_enabled                = false  # bool | computed

}

