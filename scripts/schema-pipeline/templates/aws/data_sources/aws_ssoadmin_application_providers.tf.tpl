# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssoadmin_application_providers                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssoadmin_application_providers" "this" {


  # id = ""     # string | computed

  application_providers { # list

    # application_provider_arn = ""     # string | computed
    # federation_protocol      = ""     # string | computed

    display_data { # list

      # description  = ""     # string | computed
      # display_name = ""     # string | computed
      # icon_url     = ""     # string | computed

    }

  }

}

