# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_grafana_role_association                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_grafana_role_association" "this" {

  role         = ""     # string | required
  workspace_id = ""     # string | required
  group_ids    = []     # set(string) | optional
  id           = ""     # string | optional+computed
  user_ids     = []     # set(string) | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

