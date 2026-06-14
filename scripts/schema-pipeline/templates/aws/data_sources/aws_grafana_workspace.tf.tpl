# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_grafana_workspace                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_grafana_workspace" "this" {

  workspace_id              = ""     # string | required
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # account_access_type       = ""     # string | computed
  # arn                       = ""     # string | computed
  # authentication_providers  = []     # list(string) | computed
  # created_date              = ""     # string | computed
  # data_sources              = []     # list(string) | computed
  # description               = ""     # string | computed
  # endpoint                  = ""     # string | computed
  # grafana_version           = ""     # string | computed
  # last_updated_date         = ""     # string | computed
  # name                      = ""     # string | computed
  # notification_destinations = []     # list(string) | computed
  # organization_role_name    = ""     # string | computed
  # organizational_units      = []     # list(string) | computed
  # permission_type           = ""     # string | computed
  # role_arn                  = ""     # string | computed
  # saml_configuration_status = ""     # string | computed
  # stack_set_name            = ""     # string | computed
  # status                    = ""     # string | computed

}

