# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_shield_drt_access_log_bucket_association        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_shield_drt_access_log_bucket_association" "this" {

  log_bucket              = ""     # string | required
  role_arn_association_id = ""     # string | required | Unused

  # id                      = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

