# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_shard_group                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_shard_group" "this" {

  db_cluster_identifier      = ""     # string | required
  db_shard_group_identifier  = ""     # string | required
  max_acu                    = 0      # number | required
  compute_redundancy         = 0      # number | optional+computed
  min_acu                    = 0      # number | optional+computed
  publicly_accessible        = false  # bool | optional+computed
  tags                       = {}     # map(string) | optional

  # arn                        = ""     # string | computed
  # db_shard_group_resource_id = ""     # string | computed
  # endpoint                   = ""     # string | computed
  # tags_all                   = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

