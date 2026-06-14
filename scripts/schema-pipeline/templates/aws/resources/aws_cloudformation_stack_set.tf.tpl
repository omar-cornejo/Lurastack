# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudformation_stack_set                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudformation_stack_set" "this" {

  name                    = ""     # string | required
  administration_role_arn = ""     # string | optional
  call_as                 = ""     # string | optional
  capabilities            = []     # set(string) | optional
  description             = ""     # string | optional
  execution_role_name     = ""     # string | optional+computed
  id                      = ""     # string | optional+computed
  parameters              = {}     # map(string) | optional
  permission_model        = ""     # string | optional
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed
  template_body           = ""     # string | optional+computed
  template_url            = ""     # string | optional

  # arn                     = ""     # string | computed
  # stack_set_id            = ""     # string | computed

  auto_deployment { # list [0..1]
    enabled                          = false  # bool | optional
    retain_stacks_on_account_removal = false  # bool | optional

  }

  managed_execution { # list [0..1]
    active = false  # bool | optional

  }

  operation_preferences { # list [0..1]
    failure_tolerance_count      = 0      # number | optional
    failure_tolerance_percentage = 0      # number | optional
    max_concurrent_count         = 0      # number | optional
    max_concurrent_percentage    = 0      # number | optional
    region_concurrency_type      = ""     # string | optional
    region_order                 = []     # list(string) | optional

  }

  timeouts { # single
    update = ""     # string | optional

  }

}

