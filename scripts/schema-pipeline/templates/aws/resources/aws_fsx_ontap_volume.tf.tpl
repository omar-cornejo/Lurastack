# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_ontap_volume                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_ontap_volume" "this" {

  name                                 = ""     # string | required
  storage_virtual_machine_id           = ""     # string | required
  bypass_snaplock_enterprise_retention = false  # bool | optional
  copy_tags_to_backups                 = false  # bool | optional
  final_backup_tags                    = {}     # map(string) | optional
  id                                   = ""     # string | optional+computed
  junction_path                        = ""     # string | optional
  ontap_volume_type                    = ""     # string | optional+computed
  security_style                       = ""     # string | optional+computed
  size_in_bytes                        = ""     # string | optional+computed
  size_in_megabytes                    = 0      # number | optional+computed
  skip_final_backup                    = false  # bool | optional
  snapshot_policy                      = ""     # string | optional+computed
  storage_efficiency_enabled           = false  # bool | optional
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed
  volume_style                         = ""     # string | optional+computed
  volume_type                          = ""     # string | optional

  # arn                                  = ""     # string | computed
  # file_system_id                       = ""     # string | computed
  # flexcache_endpoint_type              = ""     # string | computed
  # uuid                                 = ""     # string | computed

  aggregate_configuration { # list [0..1]
    aggregates                 = []     # list(string) | optional+computed
    constituents_per_aggregate = 0      # number | optional+computed

    # total_constituents         = 0      # number | computed

  }

  snaplock_configuration { # list [0..1]
    snaplock_type              = ""     # string | required
    audit_log_volume           = false  # bool | optional
    privileged_delete          = ""     # string | optional
    volume_append_mode_enabled = false  # bool | optional

    autocommit_period { # list [0..1]
      type  = ""     # string | optional+computed
      value = 0      # number | optional

    }

    retention_period { # list [0..1]

      default_retention { # list [0..1]
        type  = ""     # string | optional+computed
        value = 0      # number | optional

      }

      maximum_retention { # list [0..1]
        type  = ""     # string | optional+computed
        value = 0      # number | optional

      }

      minimum_retention { # list [0..1]
        type  = ""     # string | optional+computed
        value = 0      # number | optional

      }

    }

  }

  tiering_policy { # list [0..1]
    cooling_period = 0      # number | optional+computed
    name           = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

