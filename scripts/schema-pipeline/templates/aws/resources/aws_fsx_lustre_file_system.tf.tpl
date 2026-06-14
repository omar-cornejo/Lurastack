# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_lustre_file_system                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_lustre_file_system" "this" {

  subnet_ids                        = []     # list(string) | required
  auto_import_policy                = ""     # string | optional+computed
  automatic_backup_retention_days   = 0      # number | optional+computed
  backup_id                         = ""     # string | optional
  copy_tags_to_backups              = false  # bool | optional
  daily_automatic_backup_start_time = ""     # string | optional+computed
  data_compression_type             = ""     # string | optional
  deployment_type                   = ""     # string | optional
  drive_cache_type                  = ""     # string | optional
  efa_enabled                       = false  # bool | optional+computed
  export_path                       = ""     # string | optional+computed
  file_system_type_version          = ""     # string | optional+computed
  final_backup_tags                 = {}     # map(string) | optional
  id                                = ""     # string | optional+computed
  import_path                       = ""     # string | optional
  imported_file_chunk_size          = 0      # number | optional+computed
  kms_key_id                        = ""     # string | optional+computed
  per_unit_storage_throughput       = 0      # number | optional
  security_group_ids                = []     # set(string) | optional
  skip_final_backup                 = false  # bool | optional
  storage_capacity                  = 0      # number | optional
  storage_type                      = ""     # string | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed
  throughput_capacity               = 0      # number | optional
  weekly_maintenance_start_time     = ""     # string | optional+computed

  # arn                               = ""     # string | computed
  # dns_name                          = ""     # string | computed
  # mount_name                        = ""     # string | computed
  # network_interface_ids             = []     # list(string) | computed
  # owner_id                          = ""     # string | computed
  # vpc_id                            = ""     # string | computed

  data_read_cache_configuration { # list [0..1]
    sizing_mode = ""     # string | required
    size        = 0      # number | optional

  }

  log_configuration { # list [0..1]
    destination = ""     # string | optional+computed
    level       = ""     # string | optional

  }

  metadata_configuration { # list [0..1]
    iops = 0      # number | optional+computed
    mode = ""     # string | optional+computed

  }

  root_squash_configuration { # list [0..1]
    no_squash_nids = []     # set(string) | optional
    root_squash    = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

