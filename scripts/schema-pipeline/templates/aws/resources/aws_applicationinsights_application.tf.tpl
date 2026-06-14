# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_applicationinsights_application                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_applicationinsights_application" "this" {

  resource_group_name    = ""     # string | required
  auto_config_enabled    = false  # bool | optional
  auto_create            = false  # bool | optional
  cwe_monitor_enabled    = false  # bool | optional
  grouping_type          = ""     # string | optional
  id                     = ""     # string | optional+computed
  ops_center_enabled     = false  # bool | optional
  ops_item_sns_topic_arn = ""     # string | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed

}

