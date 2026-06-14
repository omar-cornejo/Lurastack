# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_docdbelastic_cluster                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_docdbelastic_cluster" "this" {

  admin_user_name              = ""     # string | required
  admin_user_password          = ""     # string | required+sensitive
  auth_type                    = ""     # string | required
  name                         = ""     # string | required
  shard_capacity               = 0      # number | required
  shard_count                  = 0      # number | required
  backup_retention_period      = 0      # number | optional+computed
  kms_key_id                   = ""     # string | optional+computed
  preferred_backup_window      = ""     # string | optional+computed
  preferred_maintenance_window = ""     # string | optional+computed
  subnet_ids                   = []     # set(string) | optional+computed
  tags                         = {}     # map(string) | optional
  vpc_security_group_ids       = []     # set(string) | optional+computed

  # arn                          = ""     # string | computed
  # endpoint                     = ""     # string | computed
  # id                           = ""     # string | computed
  # tags_all                     = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

