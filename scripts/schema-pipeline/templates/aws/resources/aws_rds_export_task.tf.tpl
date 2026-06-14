# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_export_task                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_export_task" "this" {

  export_task_identifier = ""     # string | required
  iam_role_arn           = ""     # string | required
  kms_key_id             = ""     # string | required
  s3_bucket_name         = ""     # string | required
  source_arn             = ""     # string | required
  export_only            = []     # list(string) | optional
  s3_prefix              = ""     # string | optional+computed

  # failure_cause          = ""     # string | computed
  # id                     = ""     # string | computed
  # percent_progress       = 0      # number | computed
  # snapshot_time          = ""     # string | computed
  # source_type            = ""     # string | computed
  # status                 = ""     # string | computed
  # task_end_time          = ""     # string | computed
  # task_start_time        = ""     # string | computed
  # warning_message        = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

