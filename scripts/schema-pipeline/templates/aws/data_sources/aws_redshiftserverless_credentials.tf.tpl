# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_redshiftserverless_credentials                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_redshiftserverless_credentials" "this" {

  workgroup_name   = ""     # string | required
  db_name          = ""     # string | optional
  duration_seconds = 0      # number | optional
  id               = ""     # string | optional+computed

  # db_password      = ""     # string | computed+sensitive
  # db_user          = ""     # string | computed
  # expiration       = ""     # string | computed

}

