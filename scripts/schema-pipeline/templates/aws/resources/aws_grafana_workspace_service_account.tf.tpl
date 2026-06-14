# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_grafana_workspace_service_account               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_grafana_workspace_service_account" "this" {

  grafana_role       = ""     # string | required
  name               = ""     # string | required
  workspace_id       = ""     # string | required

  # id                 = ""     # string | computed
  # service_account_id = ""     # string | computed

}

