# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_crawler                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_crawler" "this" {

  database_name          = ""     # string | required
  name                   = ""     # string | required
  role                   = ""     # string | required
  classifiers            = []     # list(string) | optional
  configuration          = ""     # string | optional
  description            = ""     # string | optional
  id                     = ""     # string | optional+computed
  schedule               = ""     # string | optional
  security_configuration = ""     # string | optional
  table_prefix           = ""     # string | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed

  catalog_target { # list
    database_name       = ""     # string | required
    tables              = []     # list(string) | required
    connection_name     = ""     # string | optional
    dlq_event_queue_arn = ""     # string | optional
    event_queue_arn     = ""     # string | optional

  }

  delta_target { # list
    delta_tables              = []     # set(string) | required
    write_manifest            = false  # bool | required
    connection_name           = ""     # string | optional
    create_native_delta_table = false  # bool | optional

  }

  dynamodb_target { # list
    path      = ""     # string | required
    scan_all  = false  # bool | optional
    scan_rate = 0      # number | optional

  }

  hudi_target { # list
    maximum_traversal_depth = 0      # number | required
    paths                   = []     # set(string) | required
    connection_name         = ""     # string | optional
    exclusions              = []     # list(string) | optional

  }

  iceberg_target { # list
    maximum_traversal_depth = 0      # number | required
    paths                   = []     # set(string) | required
    connection_name         = ""     # string | optional
    exclusions              = []     # list(string) | optional

  }

  jdbc_target { # list
    connection_name            = ""     # string | required
    path                       = ""     # string | required
    enable_additional_metadata = []     # list(string) | optional
    exclusions                 = []     # list(string) | optional

  }

  lake_formation_configuration { # list [0..1]
    account_id                     = ""     # string | optional+computed
    use_lake_formation_credentials = false  # bool | optional

  }

  lineage_configuration { # list [0..1]
    crawler_lineage_settings = ""     # string | optional

  }

  mongodb_target { # list
    connection_name = ""     # string | required
    path            = ""     # string | required
    scan_all        = false  # bool | optional

  }

  recrawl_policy { # list [0..1]
    recrawl_behavior = ""     # string | optional

  }

  s3_target { # list
    path                = ""     # string | required
    connection_name     = ""     # string | optional
    dlq_event_queue_arn = ""     # string | optional
    event_queue_arn     = ""     # string | optional
    exclusions          = []     # list(string) | optional
    sample_size         = 0      # number | optional

  }

  schema_change_policy { # list [0..1]
    delete_behavior = ""     # string | optional
    update_behavior = ""     # string | optional

  }

}

