# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssoadmin_application                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssoadmin_application" "this" {

  application_arn          = ""     # string | required

  # application_account      = ""     # string | computed
  # application_provider_arn = ""     # string | computed
  # description              = ""     # string | computed
  # id                       = ""     # string | computed
  # instance_arn             = ""     # string | computed
  # name                     = ""     # string | computed
  # status                   = ""     # string | computed

  portal_options { # list

    # visibility = ""     # string | computed

    sign_in_options { # list

      # application_url = ""     # string | computed
      # origin          = ""     # string | computed

    }

  }

}

