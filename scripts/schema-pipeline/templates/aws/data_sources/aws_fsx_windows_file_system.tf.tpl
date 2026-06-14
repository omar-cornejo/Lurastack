# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_fsx_windows_file_system                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_fsx_windows_file_system" "this" {

  id                                = ""     # string | required
  tags                              = {}     # map(string) | optional+computed

  # active_directory_id               = ""     # string | computed
  # aliases                           = []     # set(string) | computed
  # arn                               = ""     # string | computed
  # audit_log_configuration = [  # list(object)
  #   {
  #     audit_log_destination = ""
  #     file_access_audit_log_level = ""
  #     file_share_access_audit_log_level = ""
  #   }
  # ]
  # automatic_backup_retention_days   = 0      # number | computed
  # backup_id                         = ""     # string | computed
  # copy_tags_to_backups              = false  # bool | computed
  # daily_automatic_backup_start_time = ""     # string | computed
  # deployment_type                   = ""     # string | computed
  # disk_iops_configuration = [  # list(object)
  #   {
  #     iops = 0
  #     mode = ""
  #   }
  # ]
  # dns_name                          = ""     # string | computed
  # kms_key_id                        = ""     # string | computed
  # network_interface_ids             = []     # set(string) | computed
  # owner_id                          = ""     # string | computed
  # preferred_file_server_ip          = ""     # string | computed
  # preferred_subnet_id               = ""     # string | computed
  # security_group_ids                = []     # set(string) | computed
  # skip_final_backup                 = false  # bool | computed
  # storage_capacity                  = 0      # number | computed
  # storage_type                      = ""     # string | computed
  # subnet_ids                        = []     # set(string) | computed
  # throughput_capacity               = 0      # number | computed
  # vpc_id                            = ""     # string | computed
  # weekly_maintenance_start_time     = ""     # string | computed

}

