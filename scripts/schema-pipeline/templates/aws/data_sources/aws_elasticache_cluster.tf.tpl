# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elasticache_cluster                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_elasticache_cluster" "this" {

  cluster_id                 = ""     # string | required
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # availability_zone          = ""     # string | computed
  # cache_nodes = [  # list(object)
  #   {
  #     address = ""
  #     availability_zone = ""
  #     id = ""
  #     outpost_arn = ""
  #     port = 0
  #   }
  # ]
  # cluster_address            = ""     # string | computed
  # configuration_endpoint     = ""     # string | computed
  # engine                     = ""     # string | computed
  # engine_version             = ""     # string | computed
  # ip_discovery               = ""     # string | computed
  # log_delivery_configuration = [  # set(object)
  #   {
  #     destination = ""
  #     destination_type = ""
  #     log_format = ""
  #     log_type = ""
  #   }
  # ]
  # maintenance_window         = ""     # string | computed
  # network_type               = ""     # string | computed
  # node_type                  = ""     # string | computed
  # notification_topic_arn     = ""     # string | computed
  # num_cache_nodes            = 0      # number | computed
  # parameter_group_name       = ""     # string | computed
  # port                       = 0      # number | computed
  # preferred_outpost_arn      = ""     # string | computed
  # replication_group_id       = ""     # string | computed
  # security_group_ids         = []     # set(string) | computed
  # snapshot_retention_limit   = 0      # number | computed
  # snapshot_window            = ""     # string | computed
  # subnet_group_name          = ""     # string | computed

}

