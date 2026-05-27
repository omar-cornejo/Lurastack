# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket" "this" {

  acceleration_status         = ""     # string | optional+computed+DEPRECATED
  acl                         = ""     # string | optional+computed+DEPRECATED
  bucket                      = ""     # string | optional+computed
  bucket_prefix               = ""     # string | optional+computed
  force_destroy               = false  # bool | optional
  id                          = ""     # string | optional+computed
  object_lock_enabled         = false  # bool | optional+computed
  policy                      = ""     # string | optional+computed+DEPRECATED
  request_payer               = ""     # string | optional+computed+DEPRECATED
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # bucket_domain_name          = ""     # string | computed
  # bucket_regional_domain_name = ""     # string | computed
  # hosted_zone_id              = ""     # string | computed
  # region                      = ""     # string | computed
  # website_domain              = ""     # string | computed+DEPRECATED
  # website_endpoint            = ""     # string | computed+DEPRECATED

  cors_rule { # list DEPRECATED
    allowed_methods = []     # list(string) | required
    allowed_origins = []     # list(string) | required
    allowed_headers = []     # list(string) | optional
    expose_headers  = []     # list(string) | optional
    max_age_seconds = 0      # number | optional

  }

  grant { # set DEPRECATED
    permissions = []     # set(string) | required
    type        = ""     # string | required
    id          = ""     # string | optional
    uri         = ""     # string | optional

  }

  lifecycle_rule { # list DEPRECATED
    enabled                                = false  # bool | required
    abort_incomplete_multipart_upload_days = 0      # number | optional
    id                                     = ""     # string | optional+computed
    prefix                                 = ""     # string | optional
    tags                                   = {}     # map(string) | optional

    expiration { # list [0..1]
      date                         = ""     # string | optional
      days                         = 0      # number | optional
      expired_object_delete_marker = false  # bool | optional

    }

    noncurrent_version_expiration { # list [0..1]
      days = 0      # number | optional

    }

    noncurrent_version_transition { # set
      storage_class = ""     # string | required
      days          = 0      # number | optional

    }

    transition { # set
      storage_class = ""     # string | required
      date          = ""     # string | optional
      days          = 0      # number | optional

    }

  }

  logging { # list [0..1] DEPRECATED
    target_bucket = ""     # string | required
    target_prefix = ""     # string | optional

  }

  object_lock_configuration { # list [0..1] DEPRECATED
    object_lock_enabled = ""     # string | optional+DEPRECATED

    rule { # list [0..1] DEPRECATED

      default_retention { # list [1..1]
        mode  = ""     # string | required
        days  = 0      # number | optional
        years = 0      # number | optional

      }

    }

  }

  replication_configuration { # list [0..1] DEPRECATED
    role = ""     # string | required

    rules { # set [1..*]
      status                           = ""     # string | required
      delete_marker_replication_status = ""     # string | optional
      id                               = ""     # string | optional
      prefix                           = ""     # string | optional
      priority                         = 0      # number | optional

      destination { # list [1..1]
        bucket             = ""     # string | required
        account_id         = ""     # string | optional
        replica_kms_key_id = ""     # string | optional
        storage_class      = ""     # string | optional

        access_control_translation { # list [0..1]
          owner = ""     # string | required

        }

        metrics { # list [0..1]
          minutes = 0      # number | optional
          status  = ""     # string | optional

        }

        replication_time { # list [0..1]
          minutes = 0      # number | optional
          status  = ""     # string | optional

        }

      }

      filter { # list [0..1]
        prefix = ""     # string | optional
        tags   = {}     # map(string) | optional

      }

      source_selection_criteria { # list [0..1]

        sse_kms_encrypted_objects { # list [0..1]
          enabled = false  # bool | required

        }

      }

    }

  }

  server_side_encryption_configuration { # list [0..1] DEPRECATED

    rule { # list [1..1]
      bucket_key_enabled = false  # bool | optional

      apply_server_side_encryption_by_default { # list [1..1]
        sse_algorithm     = ""     # string | required
        kms_master_key_id = ""     # string | optional

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

  versioning { # list [0..1] DEPRECATED
    enabled    = false  # bool | optional
    mfa_delete = false  # bool | optional

  }

  website { # list [0..1] DEPRECATED
    error_document           = ""     # string | optional
    index_document           = ""     # string | optional
    redirect_all_requests_to = ""     # string | optional
    routing_rules            = ""     # string | optional

  }

}

