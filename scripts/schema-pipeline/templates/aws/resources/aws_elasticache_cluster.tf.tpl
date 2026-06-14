# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_cluster                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_cluster" "this" {

  cluster_id                   = ""     # string | required
  apply_immediately            = false  # bool | optional+computed
  auto_minor_version_upgrade   = ""     # string | optional
  availability_zone            = ""     # string | optional+computed
  az_mode                      = ""     # string | optional+computed
  engine                       = ""     # string | optional+computed
  engine_version               = ""     # string | optional+computed
  final_snapshot_identifier    = ""     # string | optional
  id                           = ""     # string | optional+computed
  ip_discovery                 = ""     # string | optional+computed
  maintenance_window           = ""     # string | optional+computed
  network_type                 = ""     # string | optional+computed
  node_type                    = ""     # string | optional+computed
  notification_topic_arn       = ""     # string | optional
  num_cache_nodes              = 0      # number | optional+computed
  outpost_mode                 = ""     # string | optional
  parameter_group_name         = ""     # string | optional+computed
  port                         = 0      # number | optional+computed
  preferred_availability_zones = []     # list(string) | optional
  preferred_outpost_arn        = ""     # string | optional+computed
  replication_group_id         = ""     # string | optional+computed
  security_group_ids           = []     # set(string) | optional+computed
  snapshot_arns                = []     # list(string) | optional
  snapshot_name                = ""     # string | optional
  snapshot_retention_limit     = 0      # number | optional
  snapshot_window              = ""     # string | optional+computed
  subnet_group_name            = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed
  transit_encryption_enabled   = false  # bool | optional+computed

  # arn                          = ""     # string | computed
  # cache_nodes = [  # list(object)
  #   {
  #     address = ""
  #     availability_zone = ""
  #     id = ""
  #     outpost_arn = ""
  #     port = 0
  #   }
  # ]
  # cluster_address              = ""     # string | computed
  # configuration_endpoint       = ""     # string | computed
  # engine_version_actual        = ""     # string | computed

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

