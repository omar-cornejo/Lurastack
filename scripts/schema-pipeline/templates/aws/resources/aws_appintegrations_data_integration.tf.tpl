# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appintegrations_data_integration                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appintegrations_data_integration" "this" {

  kms_key     = ""     # string | required
  name        = ""     # string | required
  source_uri  = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  schedule_config { # list [1..1]
    first_execution_from = ""     # string | required
    object               = ""     # string | required
    schedule_expression  = ""     # string | required

  }

}

