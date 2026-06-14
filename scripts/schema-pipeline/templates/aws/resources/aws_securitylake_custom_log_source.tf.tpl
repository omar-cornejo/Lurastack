# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securitylake_custom_log_source                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securitylake_custom_log_source" "this" {

  source_name      = ""     # string | required
  event_classes    = []     # set(string) | optional
  source_version   = ""     # string | optional+computed

  # attributes = [  # list(object)
  #   {
  #     crawler_arn = ""
  #     database_arn = ""
  #     table_arn = ""
  #   }
  # ]
  # id               = ""     # string | computed
  # provider_details = [  # list(object)
  #   {
  #     location = ""
  #     role_arn = ""
  #   }
  # ]

  configuration { # list

    crawler_configuration { # list
      role_arn = ""     # string | required

    }

    provider_identity { # list
      external_id = ""     # string | required
      principal   = ""     # string | required

    }

  }

}

