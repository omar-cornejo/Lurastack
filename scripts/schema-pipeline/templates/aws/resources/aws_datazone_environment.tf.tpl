# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_environment                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_environment" "this" {

  domain_identifier     = ""     # string | required
  name                  = ""     # string | required
  profile_identifier    = ""     # string | required
  project_identifier    = ""     # string | required
  account_identifier    = ""     # string | optional+computed
  account_region        = ""     # string | optional+computed
  blueprint_identifier  = ""     # string | optional+computed
  description           = ""     # string | optional
  glossary_terms        = []     # list(string) | optional

  # created_at            = ""     # string | computed
  # created_by            = ""     # string | computed
  # id                    = ""     # string | computed
  # last_deployment = [  # list(object)
  #   {
  #     deployment_id = ""
  #     deployment_status = ""
  #     deployment_type = ""
  #     failure_reasons = [  # list(object)
  #       {
  #         code = ""
  #         message = ""
  #       }
  #     ]
  #     is_deployment_complete = false
  #     messages = []  # list(string)
  #   }
  # ]
  # provider_environment  = ""     # string | computed
  # provisioned_resources = [  # list(object)
  #   {
  #     name = ""
  #     provider = ""
  #     type = ""
  #     value = ""
  #   }
  # ]

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  user_parameters { # list
    name  = ""     # string | optional
    value = ""     # string | optional

  }

}

