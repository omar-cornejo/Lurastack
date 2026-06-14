# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_integration                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_integration" "this" {

  integration_name              = ""     # string | required
  source_arn                    = ""     # string | required
  target_arn                    = ""     # string | required
  additional_encryption_context = {}     # map(string) | optional
  description                   = ""     # string | optional
  kms_key_id                    = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional

  # arn                           = ""     # string | computed
  # tags_all                      = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

