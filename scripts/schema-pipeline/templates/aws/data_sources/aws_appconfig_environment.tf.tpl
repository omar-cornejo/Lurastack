# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appconfig_environment                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_appconfig_environment" "this" {

  application_id = ""     # string | required
  environment_id = ""     # string | required
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed
  # description    = ""     # string | computed
  # monitor = [  # set(object)
  #   {
  #     alarm_arn = ""
  #     alarm_role_arn = ""
  #   }
  # ]
  # name           = ""     # string | computed
  # state          = ""     # string | computed

}

