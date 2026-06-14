# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appconfig_deployment                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appconfig_deployment" "this" {

  application_id           = ""     # string | required
  configuration_profile_id = ""     # string | required
  configuration_version    = ""     # string | required
  deployment_strategy_id   = ""     # string | required
  environment_id           = ""     # string | required
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed
  kms_key_identifier       = ""     # string | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # deployment_number        = 0      # number | computed
  # kms_key_arn              = ""     # string | computed
  # state                    = ""     # string | computed

}

