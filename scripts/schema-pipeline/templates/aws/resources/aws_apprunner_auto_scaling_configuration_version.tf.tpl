# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apprunner_auto_scaling_configuration_version    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apprunner_auto_scaling_configuration_version" "this" {

  auto_scaling_configuration_name     = ""     # string | required
  id                                  = ""     # string | optional+computed
  max_concurrency                     = 0      # number | optional
  max_size                            = 0      # number | optional
  min_size                            = 0      # number | optional
  tags                                = {}     # map(string) | optional
  tags_all                            = {}     # map(string) | optional+computed

  # arn                                 = ""     # string | computed
  # auto_scaling_configuration_revision = 0      # number | computed
  # has_associated_service              = false  # bool | computed
  # is_default                          = false  # bool | computed
  # latest                              = false  # bool | computed
  # status                              = ""     # string | computed

}

