# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_memorydb_cluster                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_memorydb_cluster" "this" {

  acl_name                   = ""     # string | required
  node_type                  = ""     # string | required
  auto_minor_version_upgrade = false  # bool | optional
  data_tiering               = false  # bool | optional
  description                = ""     # string | optional
  engine                     = ""     # string | optional+computed
  engine_version             = ""     # string | optional+computed
  final_snapshot_name        = ""     # string | optional
  id                         = ""     # string | optional+computed
  kms_key_arn                = ""     # string | optional
  maintenance_window         = ""     # string | optional+computed
  multi_region_cluster_name  = ""     # string | optional
  name                       = ""     # string | optional+computed
  name_prefix                = ""     # string | optional+computed
  num_replicas_per_shard     = 0      # number | optional
  num_shards                 = 0      # number | optional
  parameter_group_name       = ""     # string | optional+computed
  port                       = 0      # number | optional+computed
  security_group_ids         = []     # set(string) | optional
  snapshot_arns              = []     # list(string) | optional
  snapshot_name              = ""     # string | optional
  snapshot_retention_limit   = 0      # number | optional+computed
  snapshot_window            = ""     # string | optional+computed
  sns_topic_arn              = ""     # string | optional
  subnet_group_name          = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed
  tls_enabled                = false  # bool | optional

  # arn                        = ""     # string | computed
  # cluster_endpoint = [  # list(object)
  #   {
  #     address = ""
  #     port = 0
  #   }
  # ]
  # engine_patch_version       = ""     # string | computed
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

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

