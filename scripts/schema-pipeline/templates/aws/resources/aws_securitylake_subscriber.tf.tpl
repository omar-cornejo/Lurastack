# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securitylake_subscriber                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securitylake_subscriber" "this" {

  access_type            = ""     # string | optional+computed
  subscriber_description = ""     # string | optional
  subscriber_name        = ""     # string | optional
  tags                   = {}     # map(string) | optional

  # arn                    = ""     # string | computed
  # id                     = ""     # string | computed
  # resource_share_arn     = ""     # string | computed
  # resource_share_name    = ""     # string | computed
  # role_arn               = ""     # string | computed
  # s3_bucket_arn          = ""     # string | computed
  # subscriber_endpoint    = ""     # string | computed
  # subscriber_status      = ""     # string | computed
  # tags_all               = {}     # map(string) | computed

  source { # set

    aws_log_source_resource { # list
      source_name    = ""     # string | required
      source_version = ""     # string | optional+computed

    }

    custom_log_source_resource { # list
      source_name    = ""     # string | required
      source_version = ""     # string | optional+computed

      # attributes = [  # list(object)
      #   {
      #     crawler_arn = ""
      #     database_arn = ""
      #     table_arn = ""
      #   }
      # ]
      # provider = [  # list(object)
      #   {
      #     location = ""
      #     role_arn = ""
      #   }
      # ]

    }

  }

  subscriber_identity { # list
    external_id = ""     # string | required
    principal   = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

