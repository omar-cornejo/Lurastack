# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_instance_role_association                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_instance_role_association" "this" {

  db_instance_identifier = ""     # string | required
  feature_name           = ""     # string | required
  role_arn               = ""     # string | required
  id                     = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

