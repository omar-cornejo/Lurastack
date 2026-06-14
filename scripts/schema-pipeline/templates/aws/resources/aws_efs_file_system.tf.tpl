# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_efs_file_system                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_efs_file_system" "this" {

  availability_zone_name          = ""     # string | optional+computed
  creation_token                  = ""     # string | optional+computed
  encrypted                       = false  # bool | optional+computed
  id                              = ""     # string | optional+computed
  kms_key_id                      = ""     # string | optional+computed
  performance_mode                = ""     # string | optional+computed
  provisioned_throughput_in_mibps = 0      # number | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  throughput_mode                 = ""     # string | optional

  # arn                             = ""     # string | computed
  # availability_zone_id            = ""     # string | computed
  # dns_name                        = ""     # string | computed
  # name                            = ""     # string | computed
  # number_of_mount_targets         = 0      # number | computed
  # owner_id                        = ""     # string | computed
  # size_in_bytes = [  # list(object)
  #   {
  #     value = 0
  #     value_in_ia = 0
  #     value_in_standard = 0
  #   }
  # ]

  lifecycle_policy { # list [0..3]
    transition_to_archive               = ""     # string | optional
    transition_to_ia                    = ""     # string | optional
    transition_to_primary_storage_class = ""     # string | optional

  }

  protection { # list [0..1]
    replication_overwrite = ""     # string | optional+computed

  }

}

