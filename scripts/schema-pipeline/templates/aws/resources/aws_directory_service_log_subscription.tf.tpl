# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_directory_service_log_subscription              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_directory_service_log_subscription" "this" {

  directory_id   = ""     # string | required
  log_group_name = ""     # string | required
  id             = ""     # string | optional+computed

}

