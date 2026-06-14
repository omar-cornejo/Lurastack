# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_replication_group                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_replication_group" "this" {

  description                    = ""     # string | required
  replication_group_id           = ""     # string | required
  apply_immediately              = false  # bool | optional+computed
  at_rest_encryption_enabled     = ""     # string | optional+computed
  auth_token                     = ""     # string | optional+sensitive
  auth_token_update_strategy     = ""     # string | optional
  auto_minor_version_upgrade     = ""     # string | optional+computed
  automatic_failover_enabled     = false  # bool | optional
  cluster_mode                   = ""     # string | optional+computed
  data_tiering_enabled           = false  # bool | optional+computed
  engine                         = ""     # string | optional
  engine_version                 = ""     # string | optional+computed
  final_snapshot_identifier      = ""     # string | optional
  global_replication_group_id    = ""     # string | optional+computed
  id                             = ""     # string | optional+computed
  ip_discovery                   = ""     # string | optional+computed
  kms_key_id                     = ""     # string | optional
  maintenance_window             = ""     # string | optional+computed
  multi_az_enabled               = false  # bool | optional
  network_type                   = ""     # string | optional+computed
  node_type                      = ""     # string | optional+computed
  notification_topic_arn         = ""     # string | optional
  num_cache_clusters             = 0      # number | optional+computed
  num_node_groups                = 0      # number | optional+computed
  parameter_group_name           = ""     # string | optional+computed
  port                           = 0      # number | optional
  preferred_cache_cluster_azs    = []     # list(string) | optional
  replicas_per_node_group        = 0      # number | optional+computed
  security_group_ids             = []     # set(string) | optional+computed
  security_group_names           = []     # set(string) | optional+computed
  snapshot_arns                  = []     # set(string) | optional
  snapshot_name                  = ""     # string | optional
  snapshot_retention_limit       = 0      # number | optional
  snapshot_window                = ""     # string | optional+computed
  subnet_group_name              = ""     # string | optional+computed
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed
  transit_encryption_enabled     = false  # bool | optional+computed
  transit_encryption_mode        = ""     # string | optional+computed
  user_group_ids                 = []     # set(string) | optional

  # arn                            = ""     # string | computed
  # cluster_enabled                = false  # bool | computed
  # configuration_endpoint_address = ""     # string | computed
  # engine_version_actual          = ""     # string | computed
  # member_clusters                = []     # set(string) | computed
  # primary_endpoint_address       = ""     # string | computed
  # reader_endpoint_address        = ""     # string | computed

  log_delivery_configuration { # set [0..2]
    destination      = ""     # string | required
    destination_type = ""     # string | required
    log_format       = ""     # string | required
    log_type         = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

