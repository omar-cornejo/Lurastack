# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_rds_cluster                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_rds_cluster" "this" {

  cluster_identifier                  = ""     # string | required
  id                                  = ""     # string | optional+computed
  tags                                = {}     # map(string) | optional+computed

  # arn                                 = ""     # string | computed
  # availability_zones                  = []     # set(string) | computed
  # backtrack_window                    = 0      # number | computed
  # backup_retention_period             = 0      # number | computed
  # cluster_members                     = []     # set(string) | computed
  # cluster_resource_id                 = ""     # string | computed
  # cluster_scalability_type            = ""     # string | computed
  # database_insights_mode              = ""     # string | computed
  # database_name                       = ""     # string | computed
  # db_cluster_parameter_group_name     = ""     # string | computed
  # db_subnet_group_name                = ""     # string | computed
  # db_system_id                        = ""     # string | computed
  # enabled_cloudwatch_logs_exports     = []     # list(string) | computed
  # endpoint                            = ""     # string | computed
  # engine                              = ""     # string | computed
  # engine_mode                         = ""     # string | computed
  # engine_version                      = ""     # string | computed
  # final_snapshot_identifier           = ""     # string | computed
  # hosted_zone_id                      = ""     # string | computed
  # iam_database_authentication_enabled = false  # bool | computed
  # iam_roles                           = []     # set(string) | computed
  # kms_key_id                          = ""     # string | computed
  # master_user_secret = [  # list(object)
  #   {
  #     kms_key_id = ""
  #     secret_arn = ""
  #     secret_status = ""
  #   }
  # ]
  # master_username                     = ""     # string | computed
  # monitoring_interval                 = 0      # number | computed
  # monitoring_role_arn                 = ""     # string | computed
  # network_type                        = ""     # string | computed
  # port                                = 0      # number | computed
  # preferred_backup_window             = ""     # string | computed
  # preferred_maintenance_window        = ""     # string | computed
  # reader_endpoint                     = ""     # string | computed
  # replication_source_identifier       = ""     # string | computed
  # storage_encrypted                   = false  # bool | computed
  # vpc_security_group_ids              = []     # set(string) | computed

}

