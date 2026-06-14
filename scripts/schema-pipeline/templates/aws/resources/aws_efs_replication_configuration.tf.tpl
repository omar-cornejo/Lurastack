# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_efs_replication_configuration                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_efs_replication_configuration" "this" {

  source_file_system_id           = ""     # string | required
  id                              = ""     # string | optional+computed

  # creation_time                   = ""     # string | computed
  # original_source_file_system_arn = ""     # string | computed
  # source_file_system_arn          = ""     # string | computed
  # source_file_system_region       = ""     # string | computed

  destination { # list [1..1]
    availability_zone_name = ""     # string | optional
    file_system_id         = ""     # string | optional+computed
    kms_key_id             = ""     # string | optional
    region                 = ""     # string | optional+computed

    # status                 = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

