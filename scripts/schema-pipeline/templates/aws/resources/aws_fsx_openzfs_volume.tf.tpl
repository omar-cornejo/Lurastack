# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_openzfs_volume                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_openzfs_volume" "this" {

  name                             = ""     # string | required
  parent_volume_id                 = ""     # string | required
  copy_tags_to_snapshots           = false  # bool | optional
  data_compression_type            = ""     # string | optional
  delete_volume_options            = []     # list(string) | optional
  id                               = ""     # string | optional+computed
  read_only                        = false  # bool | optional+computed
  record_size_kib                  = 0      # number | optional
  storage_capacity_quota_gib       = 0      # number | optional+computed
  storage_capacity_reservation_gib = 0      # number | optional+computed
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed
  volume_type                      = ""     # string | optional

  # arn                              = ""     # string | computed

  nfs_exports { # list [0..1]

    client_configurations { # set [1..25]
      clients = ""     # string | required
      options = []     # list(string) | required

    }

  }

  origin_snapshot { # list [0..1]
    copy_strategy = ""     # string | required
    snapshot_arn  = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  user_and_group_quotas { # set [0..100]
    id                         = 0      # number | required
    storage_capacity_quota_gib = 0      # number | required
    type                       = ""     # string | required

  }

}

