# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_prometheus_alert_manager_definition             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_prometheus_alert_manager_definition" "this" {

  definition   = ""     # string | required
  workspace_id = ""     # string | required
  id           = ""     # string | optional+computed

}

