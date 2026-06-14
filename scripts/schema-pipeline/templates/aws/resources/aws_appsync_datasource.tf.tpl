# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_datasource                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_datasource" "this" {

  api_id           = ""     # string | required
  name             = ""     # string | required
  type             = ""     # string | required
  description      = ""     # string | optional
  id               = ""     # string | optional+computed
  service_role_arn = ""     # string | optional

  # arn              = ""     # string | computed

  dynamodb_config { # list [0..1]
    table_name             = ""     # string | required
    region                 = ""     # string | optional+computed
    use_caller_credentials = false  # bool | optional
    versioned              = false  # bool | optional

    delta_sync_config { # list [0..1]
      delta_sync_table_name = ""     # string | required
      base_table_ttl        = 0      # number | optional
      delta_sync_table_ttl  = 0      # number | optional

    }

  }

  elasticsearch_config { # list [0..1]
    endpoint = ""     # string | required
    region   = ""     # string | optional+computed

  }

  event_bridge_config { # list [0..1]
    event_bus_arn = ""     # string | required

  }

  http_config { # list [0..1]
    endpoint = ""     # string | required

    authorization_config { # list [0..1]
      authorization_type = ""     # string | optional

      aws_iam_config { # list [0..1]
        signing_region       = ""     # string | optional
        signing_service_name = ""     # string | optional

      }

    }

  }

  lambda_config { # list [0..1]
    function_arn = ""     # string | required

  }

  opensearchservice_config { # list [0..1]
    endpoint = ""     # string | required
    region   = ""     # string | optional+computed

  }

  relational_database_config { # list [0..1]
    source_type = ""     # string | optional

    http_endpoint_config { # list [0..1]
      aws_secret_store_arn  = ""     # string | required
      db_cluster_identifier = ""     # string | required
      database_name         = ""     # string | optional
      region                = ""     # string | optional+computed
      schema                = ""     # string | optional

    }

  }

}

