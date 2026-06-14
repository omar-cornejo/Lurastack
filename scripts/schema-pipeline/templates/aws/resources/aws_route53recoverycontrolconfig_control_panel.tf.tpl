# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53recoverycontrolconfig_control_panel      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53recoverycontrolconfig_control_panel" "this" {

  cluster_arn           = ""     # string | required
  name                  = ""     # string | required
  id                    = ""     # string | optional+computed

  # arn                   = ""     # string | computed
  # default_control_panel = false  # bool | computed
  # routing_control_count = 0      # number | computed
  # status                = ""     # string | computed

}

