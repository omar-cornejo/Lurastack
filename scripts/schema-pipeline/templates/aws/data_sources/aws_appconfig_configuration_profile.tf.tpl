# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appconfig_configuration_profile                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_appconfig_configuration_profile" "this" {

  application_id           = ""     # string | required
  configuration_profile_id = ""     # string | required
  id                       = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # description              = ""     # string | computed
  # kms_key_identifier       = ""     # string | computed
  # location_uri             = ""     # string | computed
  # name                     = ""     # string | computed
  # retrieval_role_arn       = ""     # string | computed
  # type                     = ""     # string | computed
  # validator = [  # set(object)
  #   {
  #     content = ""
  #     type = ""
  #   }
  # ]

}

