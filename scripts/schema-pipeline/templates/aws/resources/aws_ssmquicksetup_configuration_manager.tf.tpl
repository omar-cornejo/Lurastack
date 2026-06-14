# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssmquicksetup_configuration_manager             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssmquicksetup_configuration_manager" "this" {

  name             = ""     # string | required
  description      = ""     # string | optional+computed
  tags             = {}     # map(string) | optional

  # manager_arn      = ""     # string | computed
  # status_summaries = [  # list(object)
  #   {
  #     status = ""
  #     status_message = ""
  #     status_type = ""
  #   }
  # ]
  # tags_all         = {}     # map(string) | computed

  configuration_definition { # list
    parameters                               = {}     # map(string) | required
    type                                     = ""     # string | required
    local_deployment_administration_role_arn = ""     # string | optional
    local_deployment_execution_role_name     = ""     # string | optional
    type_version                             = ""     # string | optional+computed

    # id                                       = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

