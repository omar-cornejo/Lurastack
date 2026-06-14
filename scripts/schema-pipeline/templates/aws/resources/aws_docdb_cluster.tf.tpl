# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_docdb_cluster                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_docdb_cluster" "this" {

  allow_major_version_upgrade     = false  # bool | optional
  apply_immediately               = false  # bool | optional
  availability_zones              = []     # set(string) | optional+computed
  backup_retention_period         = 0      # number | optional
  cluster_identifier              = ""     # string | optional+computed
  cluster_identifier_prefix       = ""     # string | optional+computed
  cluster_members                 = []     # set(string) | optional+computed
  db_cluster_parameter_group_name = ""     # string | optional+computed
  db_subnet_group_name            = ""     # string | optional+computed
  deletion_protection             = false  # bool | optional
  enabled_cloudwatch_logs_exports = []     # list(string) | optional
  engine                          = ""     # string | optional
  engine_version                  = ""     # string | optional+computed
  final_snapshot_identifier       = ""     # string | optional
  global_cluster_identifier       = ""     # string | optional
  id                              = ""     # string | optional+computed
  kms_key_id                      = ""     # string | optional+computed
  manage_master_user_password     = false  # bool | optional
  master_password                 = ""     # string | optional+sensitive
  master_password_wo              = ""     # string | optional+write_only
  master_password_wo_version      = 0      # number | optional
  master_username                 = ""     # string | optional+computed
  port                            = 0      # number | optional
  preferred_backup_window         = ""     # string | optional+computed
  preferred_maintenance_window    = ""     # string | optional+computed
  skip_final_snapshot             = false  # bool | optional
  snapshot_identifier             = ""     # string | optional
  storage_encrypted               = false  # bool | optional
  storage_type                    = ""     # string | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  vpc_security_group_ids          = []     # set(string) | optional+computed

  # arn                             = ""     # string | computed
  # cluster_resource_id             = ""     # string | computed
  # endpoint                        = ""     # string | computed
  # hosted_zone_id                  = ""     # string | computed
  # master_user_secret = [  # list(object)
  #   {
  #     kms_key_id = ""
  #     secret_arn = ""
  #     secret_status = ""
  #   }
  # ]
  # reader_endpoint                 = ""     # string | computed

  restore_to_point_in_time { # list [0..1]
    source_cluster_identifier  = ""     # string | required
    restore_to_time            = ""     # string | optional
    restore_type               = ""     # string | optional
    use_latest_restorable_time = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

