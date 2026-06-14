# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_logically_air_gapped_vault               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_logically_air_gapped_vault" "this" {

  max_retention_days = 0      # number | required
  min_retention_days = 0      # number | required
  name               = ""     # string | required
  tags               = {}     # map(string) | optional

  # arn                = ""     # string | computed
  # id                 = ""     # string | computed
  # tags_all           = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

