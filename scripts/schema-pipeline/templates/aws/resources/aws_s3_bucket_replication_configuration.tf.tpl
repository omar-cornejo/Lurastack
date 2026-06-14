# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_replication_configuration             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_replication_configuration" "this" {

  bucket = ""     # string | required
  role   = ""     # string | required
  id     = ""     # string | optional+computed
  token  = ""     # string | optional+sensitive

  rule { # list [1..1000]
    status   = ""     # string | required
    id       = ""     # string | optional+computed
    prefix   = ""     # string | optional+DEPRECATED
    priority = 0      # number | optional

    delete_marker_replication { # list [0..1]
      status = ""     # string | required

    }

    destination { # list [1..1]
      bucket        = ""     # string | required
      account       = ""     # string | optional
      storage_class = ""     # string | optional

      access_control_translation { # list [0..1]
        owner = ""     # string | required

      }

      encryption_configuration { # list [0..1]
        replica_kms_key_id = ""     # string | required

      }

      metrics { # list [0..1]
        status = ""     # string | required

        event_threshold { # list [0..1]
          minutes = 0      # number | required

        }

      }

      replication_time { # list [0..1]
        status = ""     # string | required

        time { # list [1..1]
          minutes = 0      # number | required

        }

      }

    }

    existing_object_replication { # list [0..1]
      status = ""     # string | required

    }

    filter { # list [0..1]
      prefix = ""     # string | optional

      and { # list [0..1]
        prefix = ""     # string | optional
        tags   = {}     # map(string) | optional

      }

      tag { # list [0..1]
        key   = ""     # string | required
        value = ""     # string | required

      }

    }

    source_selection_criteria { # list [0..1]

      replica_modifications { # list [0..1]
        status = ""     # string | required

      }

      sse_kms_encrypted_objects { # list [0..1]
        status = ""     # string | required

      }

    }

  }

}

