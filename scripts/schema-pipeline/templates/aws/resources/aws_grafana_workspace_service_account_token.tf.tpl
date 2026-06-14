# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_grafana_workspace_service_account_token         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_grafana_workspace_service_account_token" "this" {

  name                     = ""     # string | required
  seconds_to_live          = 0      # number | required
  service_account_id       = ""     # string | required
  workspace_id             = ""     # string | required

  # created_at               = ""     # string | computed
  # expires_at               = ""     # string | computed
  # id                       = ""     # string | computed
  # key                      = ""     # string | computed+sensitive
  # service_account_token_id = ""     # string | computed

}

