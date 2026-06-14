# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opsworks_rds_db_instance                        │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_opsworks_rds_db_instance" "this" {

  db_password         = ""     # string | required+sensitive
  db_user             = ""     # string | required
  rds_db_instance_arn = ""     # string | required
  stack_id            = ""     # string | required
  id                  = ""     # string | optional+computed

}

