# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appfabric_app_authorization_connection          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appfabric_app_authorization_connection" "this" {

  app_authorization_arn = ""     # string | required
  app_bundle_arn        = ""     # string | required

  # app                   = ""     # string | computed
  # id                    = ""     # string | computed
  # tenant = [  # list(object)
  #   {
  #     tenant_display_name = ""
  #     tenant_identifier = ""
  #   }
  # ]

  auth_request { # list
    code         = ""     # string | required
    redirect_uri = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

