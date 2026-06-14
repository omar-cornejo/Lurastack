# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudwatch_event_connection                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudwatch_event_connection" "this" {

  name               = ""     # string | required
  id                 = ""     # string | optional+computed

  # arn                = ""     # string | computed
  # authorization_type = ""     # string | computed
  # kms_key_identifier = ""     # string | computed
  # secret_arn         = ""     # string | computed

}

