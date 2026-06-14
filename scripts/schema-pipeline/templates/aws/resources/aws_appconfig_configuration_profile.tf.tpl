# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appconfig_configuration_profile                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appconfig_configuration_profile" "this" {

  application_id           = ""     # string | required
  location_uri             = ""     # string | required
  name                     = ""     # string | required
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed
  kms_key_identifier       = ""     # string | optional
  retrieval_role_arn       = ""     # string | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed
  type                     = ""     # string | optional

  # arn                      = ""     # string | computed
  # configuration_profile_id = ""     # string | computed

  validator { # set [0..2]
    type    = ""     # string | required
    content = ""     # string | optional+sensitive

  }

}

