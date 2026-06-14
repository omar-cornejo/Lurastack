# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudformation_stack_instances                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudformation_stack_instances" "this" {

  stack_set_name           = ""     # string | required
  accounts                 = []     # set(string) | optional+computed
  call_as                  = ""     # string | optional
  id                       = ""     # string | optional+computed
  parameter_overrides      = {}     # map(string) | optional
  regions                  = []     # set(string) | optional+computed
  retain_stacks            = false  # bool | optional

  # stack_instance_summaries = [  # list(object)
  #   {
  #     account_id = ""
  #     detailed_status = ""
  #     drift_status = ""
  #     organizational_unit_id = ""
  #     region = ""
  #     stack_id = ""
  #     stack_set_id = ""
  #     status = ""
  #     status_reason = ""
  #   }
  # ]
  # stack_set_id             = ""     # string | computed

  deployment_targets { # list [0..1]
    account_filter_type     = ""     # string | optional
    accounts                = []     # set(string) | optional
    accounts_url            = ""     # string | optional
    organizational_unit_ids = []     # set(string) | optional

  }

  operation_preferences { # list [0..1]
    concurrency_mode             = ""     # string | optional
    failure_tolerance_count      = 0      # number | optional
    failure_tolerance_percentage = 0      # number | optional
    max_concurrent_count         = 0      # number | optional
    max_concurrent_percentage    = 0      # number | optional
    region_concurrency_type      = ""     # string | optional
    region_order                 = []     # list(string) | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

