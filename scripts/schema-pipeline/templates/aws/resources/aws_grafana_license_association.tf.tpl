# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_grafana_license_association                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_grafana_license_association" "this" {

  license_type          = ""     # string | required
  workspace_id          = ""     # string | required
  grafana_token         = ""     # string | optional
  id                    = ""     # string | optional+computed

  # free_trial_expiration = ""     # string | computed
  # license_expiration    = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

