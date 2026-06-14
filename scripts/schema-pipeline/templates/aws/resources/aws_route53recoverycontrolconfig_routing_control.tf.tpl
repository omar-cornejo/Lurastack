# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53recoverycontrolconfig_routing_control    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53recoverycontrolconfig_routing_control" "this" {

  cluster_arn       = ""     # string | required
  name              = ""     # string | required
  control_panel_arn = ""     # string | optional+computed
  id                = ""     # string | optional+computed

  # arn               = ""     # string | computed
  # status            = ""     # string | computed

}

