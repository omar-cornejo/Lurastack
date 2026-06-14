# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_windows_file_system                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_windows_file_system" "this" {

  subnet_ids                        = []     # list(string) | required
  throughput_capacity               = 0      # number | required
  active_directory_id               = ""     # string | optional
  aliases                           = []     # set(string) | optional
  automatic_backup_retention_days   = 0      # number | optional
  backup_id                         = ""     # string | optional
  copy_tags_to_backups              = false  # bool | optional
  daily_automatic_backup_start_time = ""     # string | optional+computed
  deployment_type                   = ""     # string | optional
  final_backup_tags                 = {}     # map(string) | optional
  id                                = ""     # string | optional+computed
  kms_key_id                        = ""     # string | optional+computed
  preferred_subnet_id               = ""     # string | optional+computed
  security_group_ids                = []     # set(string) | optional
  skip_final_backup                 = false  # bool | optional
  storage_capacity                  = 0      # number | optional+computed
  storage_type                      = ""     # string | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed
  weekly_maintenance_start_time     = ""     # string | optional+computed

  # arn                               = ""     # string | computed
  # dns_name                          = ""     # string | computed
  # network_interface_ids             = []     # set(string) | computed
  # owner_id                          = ""     # string | computed
  # preferred_file_server_ip          = ""     # string | computed
  # remote_administration_endpoint    = ""     # string | computed
  # vpc_id                            = ""     # string | computed

  audit_log_configuration { # list [0..1]
    audit_log_destination             = ""     # string | optional+computed
    file_access_audit_log_level       = ""     # string | optional
    file_share_access_audit_log_level = ""     # string | optional

  }

  disk_iops_configuration { # list [0..1]
    iops = 0      # number | optional+computed
    mode = ""     # string | optional

  }

  self_managed_active_directory { # list [0..1]
    dns_ips                                = []     # set(string) | required
    domain_name                            = ""     # string | required
    password                               = ""     # string | required+sensitive
    username                               = ""     # string | required
    file_system_administrators_group       = ""     # string | optional
    organizational_unit_distinguished_name = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

