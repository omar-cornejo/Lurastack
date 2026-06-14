# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_grafana_workspace_saml_configuration            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_grafana_workspace_saml_configuration" "this" {

  editor_role_values      = []     # list(string) | required
  workspace_id            = ""     # string | required
  admin_role_values       = []     # list(string) | optional
  allowed_organizations   = []     # list(string) | optional
  email_assertion         = ""     # string | optional+computed
  groups_assertion        = ""     # string | optional
  id                      = ""     # string | optional+computed
  idp_metadata_url        = ""     # string | optional
  idp_metadata_xml        = ""     # string | optional
  login_assertion         = ""     # string | optional+computed
  login_validity_duration = 0      # number | optional+computed
  name_assertion          = ""     # string | optional+computed
  org_assertion           = ""     # string | optional
  role_assertion          = ""     # string | optional

  # status                  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

