# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_instance                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_instance" "this" {

  instance_class                        = ""     # string | required
  allocated_storage                     = 0      # number | optional+computed
  allow_major_version_upgrade           = false  # bool | optional
  apply_immediately                     = false  # bool | optional
  auto_minor_version_upgrade            = false  # bool | optional
  availability_zone                     = ""     # string | optional+computed
  backup_retention_period               = 0      # number | optional+computed
  backup_target                         = ""     # string | optional+computed
  backup_window                         = ""     # string | optional+computed
  ca_cert_identifier                    = ""     # string | optional+computed
  character_set_name                    = ""     # string | optional+computed
  copy_tags_to_snapshot                 = false  # bool | optional
  custom_iam_instance_profile           = ""     # string | optional
  customer_owned_ip_enabled             = false  # bool | optional
  database_insights_mode                = ""     # string | optional+computed
  db_name                               = ""     # string | optional+computed
  db_subnet_group_name                  = ""     # string | optional+computed
  dedicated_log_volume                  = false  # bool | optional
  delete_automated_backups              = false  # bool | optional
  deletion_protection                   = false  # bool | optional
  domain                                = ""     # string | optional
  domain_auth_secret_arn                = ""     # string | optional
  domain_dns_ips                        = []     # list(string) | optional
  domain_fqdn                           = ""     # string | optional+computed
  domain_iam_role_name                  = ""     # string | optional
  domain_ou                             = ""     # string | optional
  enabled_cloudwatch_logs_exports       = []     # set(string) | optional
  engine                                = ""     # string | optional+computed
  engine_lifecycle_support              = ""     # string | optional+computed
  engine_version                        = ""     # string | optional+computed
  final_snapshot_identifier             = ""     # string | optional
  iam_database_authentication_enabled   = false  # bool | optional
  id                                    = ""     # string | optional+computed
  identifier                            = ""     # string | optional+computed
  identifier_prefix                     = ""     # string | optional+computed
  iops                                  = 0      # number | optional+computed
  kms_key_id                            = ""     # string | optional+computed
  license_model                         = ""     # string | optional+computed
  maintenance_window                    = ""     # string | optional+computed
  manage_master_user_password           = false  # bool | optional
  master_user_secret_kms_key_id         = ""     # string | optional+computed
  max_allocated_storage                 = 0      # number | optional
  monitoring_interval                   = 0      # number | optional
  monitoring_role_arn                   = ""     # string | optional+computed
  multi_az                              = false  # bool | optional+computed
  nchar_character_set_name              = ""     # string | optional+computed
  network_type                          = ""     # string | optional+computed
  option_group_name                     = ""     # string | optional+computed
  parameter_group_name                  = ""     # string | optional+computed
  password                              = ""     # string | optional+sensitive
  password_wo                           = ""     # string | optional+sensitive+write_only
  password_wo_version                   = 0      # number | optional
  performance_insights_enabled          = false  # bool | optional
  performance_insights_kms_key_id       = ""     # string | optional+computed
  performance_insights_retention_period = 0      # number | optional+computed
  port                                  = 0      # number | optional+computed
  publicly_accessible                   = false  # bool | optional
  replica_mode                          = ""     # string | optional+computed
  replicate_source_db                   = ""     # string | optional
  skip_final_snapshot                   = false  # bool | optional
  snapshot_identifier                   = ""     # string | optional+computed
  storage_encrypted                     = false  # bool | optional
  storage_throughput                    = 0      # number | optional+computed
  storage_type                          = ""     # string | optional+computed
  tags                                  = {}     # map(string) | optional
  tags_all                              = {}     # map(string) | optional+computed
  timezone                              = ""     # string | optional+computed
  upgrade_storage_config                = false  # bool | optional
  username                              = ""     # string | optional+computed
  vpc_security_group_ids                = []     # set(string) | optional+computed

  # address                               = ""     # string | computed
  # arn                                   = ""     # string | computed
  # endpoint                              = ""     # string | computed
  # engine_version_actual                 = ""     # string | computed
  # hosted_zone_id                        = ""     # string | computed
  # latest_restorable_time                = ""     # string | computed
  # listener_endpoint = [  # list(object)
  #   {
  #     address = ""
  #     hosted_zone_id = ""
  #     port = 0
  #   }
  # ]
  # master_user_secret = [  # list(object)
  #   {
  #     kms_key_id = ""
  #     secret_arn = ""
  #     secret_status = ""
  #   }
  # ]
  # replicas                              = []     # list(string) | computed
  # resource_id                           = ""     # string | computed
  # status                                = ""     # string | computed

  blue_green_update { # list [0..1]
    enabled = false  # bool | optional

  }

  restore_to_point_in_time { # list [0..1]
    restore_time                             = ""     # string | optional
    source_db_instance_automated_backups_arn = ""     # string | optional
    source_db_instance_identifier            = ""     # string | optional
    source_dbi_resource_id                   = ""     # string | optional
    use_latest_restorable_time               = false  # bool | optional

  }

  s3_import { # list [0..1]
    bucket_name           = ""     # string | required
    ingestion_role        = ""     # string | required
    source_engine         = ""     # string | required
    source_engine_version = ""     # string | required
    bucket_prefix         = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

