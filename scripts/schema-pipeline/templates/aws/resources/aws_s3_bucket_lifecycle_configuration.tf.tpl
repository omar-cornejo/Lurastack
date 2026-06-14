# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_lifecycle_configuration               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_lifecycle_configuration" "this" {

  bucket                                 = ""     # string | required
  expected_bucket_owner                  = ""     # string | optional+computed
  transition_default_minimum_object_size = ""     # string | optional+computed

  # id                                     = ""     # string | computed+DEPRECATED

  rule { # list
    id     = ""     # string | required
    status = ""     # string | required
    prefix = ""     # string | optional+computed+DEPRECATED

    abort_incomplete_multipart_upload { # list
      days_after_initiation = 0      # number | optional

    }

    expiration { # list
      date                         = ""     # string | optional
      days                         = 0      # number | optional+computed
      expired_object_delete_marker = false  # bool | optional+computed

    }

    filter { # list
      object_size_greater_than = 0      # number | optional+computed
      object_size_less_than    = 0      # number | optional+computed
      prefix                   = ""     # string | optional+computed

      and { # list
        object_size_greater_than = 0      # number | optional+computed
        object_size_less_than    = 0      # number | optional+computed
        prefix                   = ""     # string | optional+computed
        tags                     = {}     # map(string) | optional

      }

      tag { # list
        key   = ""     # string | required
        value = ""     # string | required

      }

    }

    noncurrent_version_expiration { # list
      noncurrent_days           = 0      # number | required
      newer_noncurrent_versions = 0      # number | optional+computed

    }

    noncurrent_version_transition { # set
      noncurrent_days           = 0      # number | required
      storage_class             = ""     # string | required
      newer_noncurrent_versions = 0      # number | optional+computed

    }

    transition { # set
      storage_class = ""     # string | required
      date          = ""     # string | optional
      days          = 0      # number | optional+computed

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

