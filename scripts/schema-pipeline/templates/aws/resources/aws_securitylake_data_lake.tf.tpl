# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securitylake_data_lake                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securitylake_data_lake" "this" {

  meta_store_manager_role_arn = ""     # string | required
  tags                        = {}     # map(string) | optional

  # arn                         = ""     # string | computed
  # id                          = ""     # string | computed
  # s3_bucket_arn               = ""     # string | computed
  # tags_all                    = {}     # map(string) | computed

  configuration { # list
    region                   = ""     # string | required
    encryption_configuration = []     # list(object({ kms_key_id: string })) | optional+computed

    lifecycle_configuration { # list

      expiration { # list
        days = 0      # number | optional

      }

      transition { # set
        days          = 0      # number | optional
        storage_class = ""     # string | optional

      }

    }

    replication_configuration { # list
      regions  = []     # set(string) | optional
      role_arn = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

