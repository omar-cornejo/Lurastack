# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_task                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_task" "this" {

  destination_location_arn = ""     # string | required
  source_location_arn      = ""     # string | required
  cloudwatch_log_group_arn = ""     # string | optional
  id                       = ""     # string | optional+computed
  name                     = ""     # string | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed
  task_mode                = ""     # string | optional+computed

  # arn                      = ""     # string | computed

  excludes { # list [0..1]
    filter_type = ""     # string | optional
    value       = ""     # string | optional

  }

  includes { # list [0..1]
    filter_type = ""     # string | optional
    value       = ""     # string | optional

  }

  options { # list [0..1]
    atime                          = ""     # string | optional
    bytes_per_second               = 0      # number | optional
    gid                            = ""     # string | optional
    log_level                      = ""     # string | optional
    mtime                          = ""     # string | optional
    object_tags                    = ""     # string | optional
    overwrite_mode                 = ""     # string | optional
    posix_permissions              = ""     # string | optional
    preserve_deleted_files         = ""     # string | optional
    preserve_devices               = ""     # string | optional
    security_descriptor_copy_flags = ""     # string | optional+computed
    task_queueing                  = ""     # string | optional
    transfer_mode                  = ""     # string | optional
    uid                            = ""     # string | optional
    verify_mode                    = ""     # string | optional

  }

  schedule { # list [0..1]
    schedule_expression = ""     # string | required

  }

  task_report_config { # list [0..1]
    output_type          = ""     # string | optional
    report_level         = ""     # string | optional
    s3_object_versioning = ""     # string | optional

    report_overrides { # list [0..1]
      deleted_override     = ""     # string | optional
      skipped_override     = ""     # string | optional
      transferred_override = ""     # string | optional
      verified_override    = ""     # string | optional

    }

    s3_destination { # list [1..1]
      bucket_access_role_arn = ""     # string | required
      s3_bucket_arn          = ""     # string | required
      subdirectory           = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional

  }

}

