# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudtrail_event_data_store                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudtrail_event_data_store" "this" {

  name                           = ""     # string | required
  billing_mode                   = ""     # string | optional
  id                             = ""     # string | optional+computed
  kms_key_id                     = ""     # string | optional
  multi_region_enabled           = false  # bool | optional
  organization_enabled           = false  # bool | optional
  retention_period               = 0      # number | optional
  suspend                        = ""     # string | optional
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed
  termination_protection_enabled = false  # bool | optional

  # arn                            = ""     # string | computed

  advanced_event_selector { # list
    name = ""     # string | optional+computed

    field_selector { # set
      ends_with       = []     # list(string) | optional+computed
      equals          = []     # list(string) | optional+computed
      field           = ""     # string | optional+computed
      not_ends_with   = []     # list(string) | optional+computed
      not_equals      = []     # list(string) | optional+computed
      not_starts_with = []     # list(string) | optional+computed
      starts_with     = []     # list(string) | optional+computed

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

