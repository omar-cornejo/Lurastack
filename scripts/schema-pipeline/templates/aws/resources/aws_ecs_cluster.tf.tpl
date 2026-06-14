# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecs_cluster                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecs_cluster" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  configuration { # list [0..1]

    execute_command_configuration { # list [0..1]
      kms_key_id = ""     # string | optional
      logging    = ""     # string | optional

      log_configuration { # list [0..1]
        cloud_watch_encryption_enabled = false  # bool | optional
        cloud_watch_log_group_name     = ""     # string | optional
        s3_bucket_encryption_enabled   = false  # bool | optional
        s3_bucket_name                 = ""     # string | optional
        s3_key_prefix                  = ""     # string | optional

      }

    }

    managed_storage_configuration { # list [0..1]
      fargate_ephemeral_storage_kms_key_id = ""     # string | optional
      kms_key_id                           = ""     # string | optional

    }

  }

  service_connect_defaults { # list [0..1]
    namespace = ""     # string | required

  }

  setting { # set
    name  = ""     # string | required
    value = ""     # string | required

  }

}

