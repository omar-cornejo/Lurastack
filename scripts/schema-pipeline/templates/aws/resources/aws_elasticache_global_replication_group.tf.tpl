# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_global_replication_group            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_global_replication_group" "this" {

  global_replication_group_id_suffix   = ""     # string | required
  primary_replication_group_id         = ""     # string | required
  automatic_failover_enabled           = false  # bool | optional+computed
  cache_node_type                      = ""     # string | optional+computed
  engine_version                       = ""     # string | optional+computed
  global_replication_group_description = ""     # string | optional
  id                                   = ""     # string | optional+computed
  num_node_groups                      = 0      # number | optional+computed
  parameter_group_name                 = ""     # string | optional

  # arn                                  = ""     # string | computed
  # at_rest_encryption_enabled           = false  # bool | computed
  # auth_token_enabled                   = false  # bool | computed
  # cluster_enabled                      = false  # bool | computed
  # engine                               = ""     # string | computed
  # engine_version_actual                = ""     # string | computed
  # global_node_groups = [  # set(object)
  #   {
  #     global_node_group_id = ""
  #     slots = ""
  #   }
  # ]
  # global_replication_group_id          = ""     # string | computed
  # transit_encryption_enabled           = false  # bool | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

