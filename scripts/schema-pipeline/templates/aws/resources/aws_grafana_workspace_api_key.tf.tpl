# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_grafana_workspace_api_key                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_grafana_workspace_api_key" "this" {

  key_name        = ""     # string | required
  key_role        = ""     # string | required
  seconds_to_live = 0      # number | required
  workspace_id    = ""     # string | required
  id              = ""     # string | optional+computed

  # key             = ""     # string | computed+sensitive

}

