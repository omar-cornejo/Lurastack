# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appfabric_ingestion_destination                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appfabric_ingestion_destination" "this" {

  app_bundle_arn = ""     # string | required
  ingestion_arn  = ""     # string | required
  tags           = {}     # map(string) | optional

  # arn            = ""     # string | computed
  # id             = ""     # string | computed
  # tags_all       = {}     # map(string) | computed

  destination_configuration { # list

    audit_log { # list

      destination { # list

        firehose_stream { # list
          stream_name = ""     # string | required

        }

        s3_bucket { # list
          bucket_name = ""     # string | required
          prefix      = ""     # string | optional

        }

      }

    }

  }

  processing_configuration { # list

    audit_log { # list
      format = ""     # string | required
      schema = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

