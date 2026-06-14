# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_retention_configuration                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_retention_configuration" "this" {

  retention_period_in_days = 0      # number | required

  # id                       = ""     # string | computed
  # name                     = ""     # string | computed

}

