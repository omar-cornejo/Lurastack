# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_neptune_cluster                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_neptune_cluster" "this" {

  allow_major_version_upgrade           = false  # bool | optional+computed
  apply_immediately                     = false  # bool | optional+computed
  availability_zones                    = []     # set(string) | optional+computed
  backup_retention_period               = 0      # number | optional
  cluster_identifier                    = ""     # string | optional+computed
  cluster_identifier_prefix             = ""     # string | optional+computed
  copy_tags_to_snapshot                 = false  # bool | optional
  deletion_protection                   = false  # bool | optional
  enable_cloudwatch_logs_exports        = []     # set(string) | optional
  engine                                = ""     # string | optional
  engine_version                        = ""     # string | optional+computed
  final_snapshot_identifier             = ""     # string | optional
  global_cluster_identifier             = ""     # string | optional
  iam_database_authentication_enabled   = false  # bool | optional
  iam_roles                             = []     # set(string) | optional
  id                                    = ""     # string | optional+computed
  kms_key_arn                           = ""     # string | optional+computed
  neptune_cluster_parameter_group_name  = ""     # string | optional+computed
  neptune_instance_parameter_group_name = ""     # string | optional
  neptune_subnet_group_name             = ""     # string | optional+computed
  port                                  = 0      # number | optional
  preferred_backup_window               = ""     # string | optional+computed
  preferred_maintenance_window          = ""     # string | optional+computed
  replication_source_identifier         = ""     # string | optional
  skip_final_snapshot                   = false  # bool | optional
  snapshot_identifier                   = ""     # string | optional
  storage_encrypted                     = false  # bool | optional
  storage_type                          = ""     # string | optional+computed
  tags                                  = {}     # map(string) | optional
  tags_all                              = {}     # map(string) | optional+computed
  vpc_security_group_ids                = []     # set(string) | optional+computed

  # arn                                   = ""     # string | computed
  # cluster_members                       = []     # set(string) | computed
  # cluster_resource_id                   = ""     # string | computed
  # endpoint                              = ""     # string | computed
  # hosted_zone_id                        = ""     # string | computed
  # reader_endpoint                       = ""     # string | computed

  serverless_v2_scaling_configuration { # list [0..1]
    max_capacity = 0      # number | optional
    min_capacity = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

