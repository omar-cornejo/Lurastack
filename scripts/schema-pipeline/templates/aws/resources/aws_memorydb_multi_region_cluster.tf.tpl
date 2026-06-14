# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_memorydb_multi_region_cluster                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_memorydb_multi_region_cluster" "this" {

  multi_region_cluster_name_suffix  = ""     # string | required
  node_type                         = ""     # string | required
  description                       = ""     # string | optional
  engine                            = ""     # string | optional+computed
  engine_version                    = ""     # string | optional+computed
  multi_region_parameter_group_name = ""     # string | optional+computed
  num_shards                        = 0      # number | optional+computed
  tags                              = {}     # map(string) | optional
  tls_enabled                       = false  # bool | optional+computed
  update_strategy                   = ""     # string | optional

  # arn                               = ""     # string | computed
  # multi_region_cluster_name         = ""     # string | computed
  # status                            = ""     # string | computed
  # tags_all                          = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

