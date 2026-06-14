# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_association                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_association" "this" {

  name                             = ""     # string | required
  apply_only_at_cron_interval      = false  # bool | optional
  association_name                 = ""     # string | optional
  automation_target_parameter_name = ""     # string | optional
  compliance_severity              = ""     # string | optional
  document_version                 = ""     # string | optional+computed
  id                               = ""     # string | optional+computed
  instance_id                      = ""     # string | optional+DEPRECATED
  max_concurrency                  = ""     # string | optional
  max_errors                       = ""     # string | optional
  parameters                       = {}     # map(string) | optional+computed
  schedule_expression              = ""     # string | optional
  sync_compliance                  = ""     # string | optional
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed
  wait_for_success_timeout_seconds = 0      # number | optional

  # arn                              = ""     # string | computed
  # association_id                   = ""     # string | computed

  output_location { # list [0..1]
    s3_bucket_name = ""     # string | required
    s3_key_prefix  = ""     # string | optional
    s3_region      = ""     # string | optional

  }

  targets { # list [0..5]
    key    = ""     # string | required
    values = []     # list(string) | required

  }

}

