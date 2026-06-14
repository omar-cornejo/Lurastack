# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_openzfs_file_system                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_openzfs_file_system" "this" {

  deployment_type                   = ""     # string | required
  subnet_ids                        = []     # list(string) | required
  throughput_capacity               = 0      # number | required
  automatic_backup_retention_days   = 0      # number | optional
  backup_id                         = ""     # string | optional
  copy_tags_to_backups              = false  # bool | optional
  copy_tags_to_volumes              = false  # bool | optional
  daily_automatic_backup_start_time = ""     # string | optional+computed
  delete_options                    = []     # set(string) | optional
  endpoint_ip_address_range         = ""     # string | optional+computed
  final_backup_tags                 = {}     # map(string) | optional
  id                                = ""     # string | optional+computed
  kms_key_id                        = ""     # string | optional+computed
  preferred_subnet_id               = ""     # string | optional
  route_table_ids                   = []     # set(string) | optional+computed
  security_group_ids                = []     # set(string) | optional
  skip_final_backup                 = false  # bool | optional
  storage_capacity                  = 0      # number | optional
  storage_type                      = ""     # string | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed
  weekly_maintenance_start_time     = ""     # string | optional+computed

  # arn                               = ""     # string | computed
  # dns_name                          = ""     # string | computed
  # endpoint_ip_address               = ""     # string | computed
  # network_interface_ids             = []     # list(string) | computed
  # owner_id                          = ""     # string | computed
  # root_volume_id                    = ""     # string | computed
  # vpc_id                            = ""     # string | computed

  disk_iops_configuration { # list [0..1]
    iops = 0      # number | optional+computed
    mode = ""     # string | optional

  }

  root_volume_configuration { # list [0..1]
    copy_tags_to_snapshots = false  # bool | optional
    data_compression_type  = ""     # string | optional
    read_only              = false  # bool | optional+computed
    record_size_kib        = 0      # number | optional

    nfs_exports { # list [0..1]

      client_configurations { # set [1..25]
        clients = ""     # string | required
        options = []     # list(string) | required

      }

    }

    user_and_group_quotas { # set [0..100]
      id                         = 0      # number | required
      storage_capacity_quota_gib = 0      # number | required
      type                       = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

