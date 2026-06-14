# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_bus                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_bus" "this" {

  name               = ""     # string | required
  description        = ""     # string | optional
  event_source_name  = ""     # string | optional
  id                 = ""     # string | optional+computed
  kms_key_identifier = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

  dead_letter_config { # list [0..1]
    arn = ""     # string | optional

  }

}

