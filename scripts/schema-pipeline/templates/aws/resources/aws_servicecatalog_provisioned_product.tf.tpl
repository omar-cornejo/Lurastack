# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_provisioned_product              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_provisioned_product" "this" {

  name                                   = ""     # string | required
  accept_language                        = ""     # string | optional
  id                                     = ""     # string | optional+computed
  ignore_errors                          = false  # bool | optional
  notification_arns                      = []     # list(string) | optional
  path_id                                = ""     # string | optional+computed
  path_name                              = ""     # string | optional
  product_id                             = ""     # string | optional+computed
  product_name                           = ""     # string | optional
  provisioning_artifact_id               = ""     # string | optional+computed
  provisioning_artifact_name             = ""     # string | optional
  retain_physical_resources              = false  # bool | optional
  tags                                   = {}     # map(string) | optional
  tags_all                               = {}     # map(string) | optional+computed

  # arn                                    = ""     # string | computed
  # cloudwatch_dashboard_names             = []     # set(string) | computed
  # created_time                           = ""     # string | computed
  # last_provisioning_record_id            = ""     # string | computed
  # last_record_id                         = ""     # string | computed
  # last_successful_provisioning_record_id = ""     # string | computed
  # launch_role_arn                        = ""     # string | computed
  # outputs = [  # set(object)
  #   {
  #     description = ""
  #     key = ""
  #     value = ""
  #   }
  # ]
  # status                                 = ""     # string | computed
  # status_message                         = ""     # string | computed
  # type                                   = ""     # string | computed

  provisioning_parameters { # list
    key                = ""     # string | required
    use_previous_value = false  # bool | optional
    value              = ""     # string | optional

  }

  stack_set_provisioning_preferences { # list [0..1]
    accounts                     = []     # list(string) | optional
    failure_tolerance_count      = 0      # number | optional
    failure_tolerance_percentage = 0      # number | optional
    max_concurrency_count        = 0      # number | optional
    max_concurrency_percentage   = 0      # number | optional
    regions                      = []     # list(string) | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

