# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudtrail                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudtrail" "this" {

  name                          = ""     # string | required
  s3_bucket_name                = ""     # string | required
  cloud_watch_logs_group_arn    = ""     # string | optional
  cloud_watch_logs_role_arn     = ""     # string | optional
  enable_log_file_validation    = false  # bool | optional
  enable_logging                = false  # bool | optional
  id                            = ""     # string | optional+computed
  include_global_service_events = false  # bool | optional
  is_multi_region_trail         = false  # bool | optional
  is_organization_trail         = false  # bool | optional
  kms_key_id                    = ""     # string | optional
  s3_key_prefix                 = ""     # string | optional
  sns_topic_name                = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed
  # home_region                   = ""     # string | computed
  # sns_topic_arn                 = ""     # string | computed

  advanced_event_selector { # list
    name = ""     # string | optional

    field_selector { # set [1..*]
      field           = ""     # string | required
      ends_with       = []     # list(string) | optional
      equals          = []     # list(string) | optional
      not_ends_with   = []     # list(string) | optional
      not_equals      = []     # list(string) | optional
      not_starts_with = []     # list(string) | optional
      starts_with     = []     # list(string) | optional

    }

  }

  event_selector { # list [0..5]
    exclude_management_event_sources = []     # set(string) | optional
    include_management_events        = false  # bool | optional
    read_write_type                  = ""     # string | optional

    data_resource { # list
      type   = ""     # string | required
      values = []     # list(string) | required

    }

  }

  insight_selector { # set
    insight_type = ""     # string | required

  }

}

