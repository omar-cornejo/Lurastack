# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_redshift_cluster_credentials                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_redshift_cluster_credentials" "this" {

  cluster_identifier = ""     # string | required
  db_user            = ""     # string | required
  auto_create        = false  # bool | optional
  db_groups          = []     # set(string) | optional
  db_name            = ""     # string | optional
  duration_seconds   = 0      # number | optional
  id                 = ""     # string | optional+computed

  # db_password        = ""     # string | computed+sensitive
  # expiration         = ""     # string | computed

}

