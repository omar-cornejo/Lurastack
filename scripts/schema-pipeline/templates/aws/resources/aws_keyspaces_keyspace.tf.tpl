# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_keyspaces_keyspace                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_keyspaces_keyspace" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  replication_specification { # list [0..1]
    region_list          = []     # set(string) | optional
    replication_strategy = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

