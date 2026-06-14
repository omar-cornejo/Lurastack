# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53recoverycontrolconfig_safety_rule        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53recoverycontrolconfig_safety_rule" "this" {

  control_panel_arn = ""     # string | required
  name              = ""     # string | required
  wait_period_ms    = 0      # number | required
  asserted_controls = []     # list(string) | optional
  gating_controls   = []     # list(string) | optional
  id                = ""     # string | optional+computed
  target_controls   = []     # list(string) | optional

  # arn               = ""     # string | computed
  # status            = ""     # string | computed

  rule_config { # list [1..1]
    inverted  = false  # bool | required
    threshold = 0      # number | required
    type      = ""     # string | required

  }

}

