# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_logging_options                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_logging_options" "this" {

  default_log_level = ""     # string | required
  role_arn          = ""     # string | required
  disable_all_logs  = false  # bool | optional
  id                = ""     # string | optional+computed

}

