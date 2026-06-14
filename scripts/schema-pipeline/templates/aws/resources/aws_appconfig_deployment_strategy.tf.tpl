# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appconfig_deployment_strategy                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appconfig_deployment_strategy" "this" {

  deployment_duration_in_minutes = 0      # number | required
  growth_factor                  = 0      # number | required
  name                           = ""     # string | required
  replicate_to                   = ""     # string | required
  description                    = ""     # string | optional
  final_bake_time_in_minutes     = 0      # number | optional
  growth_type                    = ""     # string | optional
  id                             = ""     # string | optional+computed
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed

  # arn                            = ""     # string | computed

}

