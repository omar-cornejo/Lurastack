# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_integration                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_integration" "this" {

  integration_name              = ""     # string | required
  source_arn                    = ""     # string | required
  target_arn                    = ""     # string | required
  additional_encryption_context = {}     # map(string) | optional
  data_filter                   = ""     # string | optional+computed
  kms_key_id                    = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional

  # arn                           = ""     # string | computed
  # id                            = ""     # string | computed
  # tags_all                      = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

