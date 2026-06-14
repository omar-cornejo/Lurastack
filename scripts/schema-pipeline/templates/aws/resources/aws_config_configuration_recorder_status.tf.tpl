# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_configuration_recorder_status            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_configuration_recorder_status" "this" {

  is_enabled = false  # bool | required
  name       = ""     # string | required
  id         = ""     # string | optional+computed

}

