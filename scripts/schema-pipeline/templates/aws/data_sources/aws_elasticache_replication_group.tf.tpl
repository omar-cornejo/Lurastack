# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elasticache_replication_group                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_elasticache_replication_group" "this" {

  replication_group_id           = ""     # string | required
  id                             = ""     # string | optional+computed

  # arn                            = ""     # string | computed
  # auth_token_enabled             = false  # bool | computed
  # automatic_failover_enabled     = false  # bool | computed
  # cluster_mode                   = ""     # string | computed
  # configuration_endpoint_address = ""     # string | computed
  # description                    = ""     # string | computed
  # log_delivery_configuration = [  # set(object)
  #   {
  #     destination = ""
  #     destination_type = ""
  #     log_format = ""
  #     log_type = ""
  #   }
  # ]
  # member_clusters                = []     # set(string) | computed
  # multi_az_enabled               = false  # bool | computed
  # node_type                      = ""     # string | computed
  # num_cache_clusters             = 0      # number | computed
  # num_node_groups                = 0      # number | computed
  # port                           = 0      # number | computed
  # primary_endpoint_address       = ""     # string | computed
  # reader_endpoint_address        = ""     # string | computed
  # replicas_per_node_group        = 0      # number | computed
  # snapshot_retention_limit       = 0      # number | computed
  # snapshot_window                = ""     # string | computed

}

