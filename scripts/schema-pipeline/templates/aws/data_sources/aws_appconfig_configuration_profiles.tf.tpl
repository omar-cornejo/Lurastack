# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appconfig_configuration_profiles                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_appconfig_configuration_profiles" "this" {

  application_id            = ""     # string | required
  id                        = ""     # string | optional+computed

  # configuration_profile_ids = []     # set(string) | computed

}

