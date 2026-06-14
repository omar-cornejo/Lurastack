# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_keyspaces_table                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_keyspaces_table" "this" {

  keyspace_name        = ""     # string | required
  table_name           = ""     # string | required
  default_time_to_live = 0      # number | optional
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed

  capacity_specification { # list [0..1]
    read_capacity_units  = 0      # number | optional
    throughput_mode      = ""     # string | optional+computed
    write_capacity_units = 0      # number | optional

  }

  client_side_timestamps { # list [0..1]
    status = ""     # string | required

  }

  comment { # list [0..1]
    message = ""     # string | optional+computed

  }

  encryption_specification { # list [0..1]
    kms_key_identifier = ""     # string | optional
    type               = ""     # string | optional+computed

  }

  point_in_time_recovery { # list [0..1]
    status = ""     # string | optional+computed

  }

  schema_definition { # list [1..1]

    clustering_key { # list
      name     = ""     # string | required
      order_by = ""     # string | required

    }

    column { # set [1..*]
      name = ""     # string | required
      type = ""     # string | required

    }

    partition_key { # list [1..*]
      name = ""     # string | required

    }

    static_column { # set
      name = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  ttl { # list [0..1]
    status = ""     # string | required

  }

}

