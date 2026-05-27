# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_cluster                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_cluster" "this" {

  engine                                = ""     # string | required
  allocated_storage                     = 0      # number | optional+computed
  allow_major_version_upgrade           = false  # bool | optional
  apply_immediately                     = false  # bool | optional+computed
  availability_zones                    = []     # set(string) | optional+computed
  backtrack_window                      = 0      # number | optional
  backup_retention_period               = 0      # number | optional+computed
  ca_certificate_identifier             = ""     # string | optional+computed
  cluster_identifier                    = ""     # string | optional+computed
  cluster_identifier_prefix             = ""     # string | optional+computed
  cluster_members                       = []     # set(string) | optional+computed
  cluster_scalability_type              = ""     # string | optional+computed
  copy_tags_to_snapshot                 = false  # bool | optional
  database_insights_mode                = ""     # string | optional+computed
  database_name                         = ""     # string | optional+computed
  db_cluster_instance_class             = ""     # string | optional
  db_cluster_parameter_group_name       = ""     # string | optional+computed
  db_instance_parameter_group_name      = ""     # string | optional
  db_subnet_group_name                  = ""     # string | optional+computed
  db_system_id                          = ""     # string | optional+computed
  delete_automated_backups              = false  # bool | optional
  deletion_protection                   = false  # bool | optional
  domain                                = ""     # string | optional
  domain_iam_role_name                  = ""     # string | optional
  enable_global_write_forwarding        = false  # bool | optional
  enable_http_endpoint                  = false  # bool | optional
  enable_local_write_forwarding         = false  # bool | optional
  enabled_cloudwatch_logs_exports       = []     # set(string) | optional
  engine_lifecycle_support              = ""     # string | optional+computed
  engine_mode                           = ""     # string | optional
  engine_version                        = ""     # string | optional+computed
  final_snapshot_identifier             = ""     # string | optional
  global_cluster_identifier             = ""     # string | optional
  iam_database_authentication_enabled   = false  # bool | optional
  iam_roles                             = []     # set(string) | optional+computed
  id                                    = ""     # string | optional+computed
  iops                                  = 0      # number | optional
  kms_key_id                            = ""     # string | optional+computed
  manage_master_user_password           = false  # bool | optional
  master_password                       = ""     # string | optional+sensitive
  master_password_wo                    = ""     # string | optional+sensitive+write_only
  master_password_wo_version            = 0      # number | optional
  master_user_secret_kms_key_id         = ""     # string | optional+computed
  master_username                       = ""     # string | optional+computed
  monitoring_interval                   = 0      # number | optional+computed
  monitoring_role_arn                   = ""     # string | optional+computed
  network_type                          = ""     # string | optional+computed
  performance_insights_enabled          = false  # bool | optional
  performance_insights_kms_key_id       = ""     # string | optional+computed
  performance_insights_retention_period = 0      # number | optional+computed
  port                                  = 0      # number | optional+computed
  preferred_backup_window               = ""     # string | optional+computed
  preferred_maintenance_window          = ""     # string | optional+computed
  replication_source_identifier         = ""     # string | optional
  skip_final_snapshot                   = false  # bool | optional
  snapshot_identifier                   = ""     # string | optional
  source_region                         = ""     # string | optional
  storage_encrypted                     = false  # bool | optional+computed
  storage_type                          = ""     # string | optional+computed
  tags                                  = {}     # map(string) | optional
  tags_all                              = {}     # map(string) | optional+computed
  vpc_security_group_ids                = []     # set(string) | optional+computed

  # arn                                   = ""     # string | computed
  # ca_certificate_valid_till             = ""     # string | computed
  # cluster_resource_id                   = ""     # string | computed
  # endpoint                              = ""     # string | computed
  # engine_version_actual                 = ""     # string | computed
  # hosted_zone_id                        = ""     # string | computed
  # master_user_secret = [  # list(object)
  #   {
  #     kms_key_id = ""
  #     secret_arn = ""
  #     secret_status = ""
  #   }
  # ]
  # reader_endpoint                       = ""     # string | computed

  restore_to_point_in_time { # list [0..1]
    restore_to_time            = ""     # string | optional
    restore_type               = ""     # string | optional
    source_cluster_identifier  = ""     # string | optional
    source_cluster_resource_id = ""     # string | optional
    use_latest_restorable_time = false  # bool | optional

  }

  s3_import { # list [0..1]
    bucket_name           = ""     # string | required
    ingestion_role        = ""     # string | required
    source_engine         = ""     # string | required
    source_engine_version = ""     # string | required
    bucket_prefix         = ""     # string | optional

  }

  scaling_configuration { # list [0..1]
    auto_pause               = false  # bool | optional
    max_capacity             = 0      # number | optional
    min_capacity             = 0      # number | optional
    seconds_before_timeout   = 0      # number | optional
    seconds_until_auto_pause = 0      # number | optional
    timeout_action           = ""     # string | optional

  }

  serverlessv2_scaling_configuration { # list [0..1]
    max_capacity             = 0      # number | required
    min_capacity             = 0      # number | required
    seconds_until_auto_pause = 0      # number | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

