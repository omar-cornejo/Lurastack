# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_application                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_application" "this" {

  application_provider_arn = ""     # string | required
  instance_arn             = ""     # string | required
  name                     = ""     # string | required
  client_token             = ""     # string | optional
  description              = ""     # string | optional
  status                   = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional

  # application_account      = ""     # string | computed
  # application_arn          = ""     # string | computed
  # id                       = ""     # string | computed
  # tags_all                 = {}     # map(string) | computed

  portal_options { # list
    visibility = ""     # string | optional+computed

    sign_in_options { # list
      origin          = ""     # string | required
      application_url = ""     # string | optional

    }

  }

}

