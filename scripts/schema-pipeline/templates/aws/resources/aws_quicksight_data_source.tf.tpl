# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_data_source                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_data_source" "this" {

  data_source_id = ""     # string | required
  name           = ""     # string | required
  type           = ""     # string | required
  aws_account_id = ""     # string | optional+computed
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed

  credentials { # list [0..1]
    copy_source_arn = ""     # string | optional
    secret_arn      = ""     # string | optional

    credential_pair { # list [0..1]
      password = ""     # string | required+sensitive
      username = ""     # string | required+sensitive

    }

  }

  parameters { # list [1..1]

    amazon_elasticsearch { # list [0..1]
      domain = ""     # string | required

    }

    athena { # list [0..1]
      work_group = ""     # string | optional

    }

    aurora { # list [0..1]
      database = ""     # string | required
      host     = ""     # string | required
      port     = 0      # number | required

    }

    aurora_postgresql { # list [0..1]
      database = ""     # string | required
      host     = ""     # string | required
      port     = 0      # number | required

    }

    aws_iot_analytics { # list [0..1]
      data_set_name = ""     # string | required

    }

    databricks { # list [0..1]
      host              = ""     # string | required
      port              = 0      # number | required
      sql_endpoint_path = ""     # string | required

    }

    jira { # list [0..1]
      site_base_url = ""     # string | required

    }

    maria_db { # list [0..1]
      database = ""     # string | required
      host     = ""     # string | required
      port     = 0      # number | required

    }

    mysql { # list [0..1]
      database = ""     # string | required
      host     = ""     # string | required
      port     = 0      # number | required

    }

    oracle { # list [0..1]
      database = ""     # string | required
      host     = ""     # string | required
      port     = 0      # number | required

    }

    postgresql { # list [0..1]
      database = ""     # string | required
      host     = ""     # string | required
      port     = 0      # number | required

    }

    presto { # list [0..1]
      catalog = ""     # string | required
      host    = ""     # string | required
      port    = 0      # number | required

    }

    rds { # list [0..1]
      database    = ""     # string | required
      instance_id = ""     # string | required

    }

    redshift { # list [0..1]
      database   = ""     # string | required
      cluster_id = ""     # string | optional
      host       = ""     # string | optional
      port       = 0      # number | optional

    }

    s3 { # list [0..1]
      role_arn = ""     # string | optional

      manifest_file_location { # list [1..1]
        bucket = ""     # string | required
        key    = ""     # string | required

      }

    }

    service_now { # list [0..1]
      site_base_url = ""     # string | required

    }

    snowflake { # list [0..1]
      database  = ""     # string | required
      host      = ""     # string | required
      warehouse = ""     # string | required

    }

    spark { # list [0..1]
      host = ""     # string | required
      port = 0      # number | required

    }

    sql_server { # list [0..1]
      database = ""     # string | required
      host     = ""     # string | required
      port     = 0      # number | required

    }

    teradata { # list [0..1]
      database = ""     # string | required
      host     = ""     # string | required
      port     = 0      # number | required

    }

    twitter { # list [0..1]
      max_rows = 0      # number | required
      query    = ""     # string | required

    }

  }

  permission { # set [0..64]
    actions   = []     # set(string) | required
    principal = ""     # string | required

  }

  ssl_properties { # list [0..1]
    disable_ssl = false  # bool | required

  }

  vpc_connection_properties { # list [0..1]
    vpc_connection_arn = ""     # string | required

  }

}

