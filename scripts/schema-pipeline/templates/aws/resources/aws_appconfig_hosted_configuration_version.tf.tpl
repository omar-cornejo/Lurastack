# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appconfig_hosted_configuration_version          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appconfig_hosted_configuration_version" "this" {

  application_id           = ""     # string | required
  configuration_profile_id = ""     # string | required
  content                  = ""     # string | required+sensitive
  content_type             = ""     # string | required
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed

  # arn                      = ""     # string | computed
  # version_number           = 0      # number | computed

}

