# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appconfig_environment                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appconfig_environment" "this" {

  application_id = ""     # string | required
  name           = ""     # string | required
  description    = ""     # string | optional+computed
  tags           = {}     # map(string) | optional

  # arn            = ""     # string | computed
  # environment_id = ""     # string | computed
  # id             = ""     # string | computed+DEPRECATED
  # state          = ""     # string | computed
  # tags_all       = {}     # map(string) | computed

  monitor { # set
    alarm_arn      = ""     # string | required
    alarm_role_arn = ""     # string | optional

  }

}

