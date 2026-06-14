# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_partition_index                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_partition_index" "this" {

  database_name = ""     # string | required
  table_name    = ""     # string | required
  catalog_id    = ""     # string | optional+computed
  id            = ""     # string | optional+computed

  partition_index { # list [1..1]
    index_name   = ""     # string | optional
    keys         = []     # list(string) | optional

    # index_status = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

