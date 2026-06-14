# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspaces_ip_group                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspaces_ip_group" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  rules { # set
    source      = ""     # string | required
    description = ""     # string | optional

  }

}

