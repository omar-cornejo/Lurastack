# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_organizations_access             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_organizations_access" "this" {

  enabled = false  # bool | required
  id      = ""     # string | optional+computed

  timeouts { # single
    read = ""     # string | optional

  }

}

