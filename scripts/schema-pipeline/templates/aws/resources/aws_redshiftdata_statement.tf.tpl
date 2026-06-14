# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshiftdata_statement                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshiftdata_statement" "this" {

  database           = ""     # string | required
  sql                = ""     # string | required
  cluster_identifier = ""     # string | optional
  db_user            = ""     # string | optional
  id                 = ""     # string | optional+computed
  secret_arn         = ""     # string | optional
  statement_name     = ""     # string | optional
  with_event         = false  # bool | optional
  workgroup_name     = ""     # string | optional

  parameters { # list
    name  = ""     # string | required
    value = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional

  }

}

