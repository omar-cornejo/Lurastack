# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_user_profile                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_user_profile" "this" {

  domain_identifier = ""     # string | required
  user_identifier   = ""     # string | required
  status            = ""     # string | optional+computed
  user_type         = ""     # string | optional+computed

  # details = [  # list(object)
  #   {
  #     iam = [  # list(object)
  #       {
  #         arn = ""
  #       }
  #     ]
  #     sso = [  # list(object)
  #       {
  #         first_name = ""
  #         last_name = ""
  #         user_name = ""
  #       }
  #     ]
  #   }
  # ]
  # id                = ""     # string | computed
  # type              = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

