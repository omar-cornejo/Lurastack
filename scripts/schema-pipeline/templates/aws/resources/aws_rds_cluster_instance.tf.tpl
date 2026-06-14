# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_cluster_instance                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_cluster_instance" "this" {

  cluster_identifier                    = ""     # string | required
  engine                                = ""     # string | required
  instance_class                        = ""     # string | required
  apply_immediately                     = false  # bool | optional+computed
  auto_minor_version_upgrade            = false  # bool | optional
  availability_zone                     = ""     # string | optional+computed
  ca_cert_identifier                    = ""     # string | optional+computed
  copy_tags_to_snapshot                 = false  # bool | optional
  custom_iam_instance_profile           = ""     # string | optional
  db_parameter_group_name               = ""     # string | optional+computed
  db_subnet_group_name                  = ""     # string | optional+computed
  engine_version                        = ""     # string | optional+computed
  force_destroy                         = false  # bool | optional
  id                                    = ""     # string | optional+computed
  identifier                            = ""     # string | optional+computed
  identifier_prefix                     = ""     # string | optional+computed
  monitoring_interval                   = 0      # number | optional
  monitoring_role_arn                   = ""     # string | optional+computed
  performance_insights_enabled          = false  # bool | optional+computed
  performance_insights_kms_key_id       = ""     # string | optional+computed
  performance_insights_retention_period = 0      # number | optional+computed
  preferred_backup_window               = ""     # string | optional+computed
  preferred_maintenance_window          = ""     # string | optional+computed
  promotion_tier                        = 0      # number | optional
  publicly_accessible                   = false  # bool | optional+computed
  tags                                  = {}     # map(string) | optional
  tags_all                              = {}     # map(string) | optional+computed

  # arn                                   = ""     # string | computed
  # dbi_resource_id                       = ""     # string | computed
  # endpoint                              = ""     # string | computed
  # engine_version_actual                 = ""     # string | computed
  # kms_key_id                            = ""     # string | computed
  # network_type                          = ""     # string | computed
  # port                                  = 0      # number | computed
  # storage_encrypted                     = false  # bool | computed
  # writer                                = false  # bool | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

