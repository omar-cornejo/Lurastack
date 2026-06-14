# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_service_setting                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_service_setting" "this" {

  setting_id    = ""     # string | required
  setting_value = ""     # string | required
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # status        = ""     # string | computed

}

