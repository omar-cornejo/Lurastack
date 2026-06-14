# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securitylake_subscriber_notification            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securitylake_subscriber_notification" "this" {

  subscriber_id       = ""     # string | required

  # endpoint_id         = ""     # string | computed+DEPRECATED
  # id                  = ""     # string | computed
  # subscriber_endpoint = ""     # string | computed

  configuration { # list

    https_notification_configuration { # list
      endpoint                    = ""     # string | required
      target_role_arn             = ""     # string | required
      authorization_api_key_name  = ""     # string | optional
      authorization_api_key_value = ""     # string | optional+sensitive
      http_method                 = ""     # string | optional

    }

    sqs_notification_configuration {} # list

  }

}

