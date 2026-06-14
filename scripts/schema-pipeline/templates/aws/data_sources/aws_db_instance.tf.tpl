# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_db_instance                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_db_instance" "this" {

  db_instance_identifier          = ""     # string | optional+computed
  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional+computed

  # address                         = ""     # string | computed
  # allocated_storage               = 0      # number | computed
  # auto_minor_version_upgrade      = false  # bool | computed
  # availability_zone               = ""     # string | computed
  # backup_retention_period         = 0      # number | computed
  # ca_cert_identifier              = ""     # string | computed
  # database_insights_mode          = ""     # string | computed
  # db_cluster_identifier           = ""     # string | computed
  # db_instance_arn                 = ""     # string | computed
  # db_instance_class               = ""     # string | computed
  # db_instance_port                = 0      # number | computed
  # db_name                         = ""     # string | computed
  # db_parameter_groups             = []     # list(string) | computed
  # db_subnet_group                 = ""     # string | computed
  # enabled_cloudwatch_logs_exports = []     # list(string) | computed
  # endpoint                        = ""     # string | computed
  # engine                          = ""     # string | computed
  # engine_version                  = ""     # string | computed
  # hosted_zone_id                  = ""     # string | computed
  # iops                            = 0      # number | computed
  # kms_key_id                      = ""     # string | computed
  # license_model                   = ""     # string | computed
  # master_user_secret = [  # list(object)
  #   {
  #     kms_key_id = ""
  #     secret_arn = ""
  #     secret_status = ""
  #   }
  # ]
  # master_username                 = ""     # string | computed
  # max_allocated_storage           = 0      # number | computed
  # monitoring_interval             = 0      # number | computed
  # monitoring_role_arn             = ""     # string | computed
  # multi_az                        = false  # bool | computed
  # network_type                    = ""     # string | computed
  # option_group_memberships        = []     # list(string) | computed
  # port                            = 0      # number | computed
  # preferred_backup_window         = ""     # string | computed
  # preferred_maintenance_window    = ""     # string | computed
  # publicly_accessible             = false  # bool | computed
  # replicate_source_db             = ""     # string | computed
  # resource_id                     = ""     # string | computed
  # storage_encrypted               = false  # bool | computed
  # storage_throughput              = 0      # number | computed
  # storage_type                    = ""     # string | computed
  # timezone                        = ""     # string | computed
  # vpc_security_groups             = []     # list(string) | computed

}

