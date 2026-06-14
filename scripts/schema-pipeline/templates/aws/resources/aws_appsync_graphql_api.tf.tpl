# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_graphql_api                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_graphql_api" "this" {

  authentication_type           = ""     # string | required
  name                          = ""     # string | required
  api_type                      = ""     # string | optional
  id                            = ""     # string | optional+computed
  introspection_config          = ""     # string | optional
  merged_api_execution_role_arn = ""     # string | optional
  query_depth_limit             = 0      # number | optional
  resolver_count_limit          = 0      # number | optional
  schema                        = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  visibility                    = ""     # string | optional
  xray_enabled                  = false  # bool | optional

  # arn                           = ""     # string | computed
  # uris                          = {}     # map(string) | computed

  additional_authentication_provider { # list
    authentication_type = ""     # string | required

    lambda_authorizer_config { # list [0..1]
      authorizer_uri                   = ""     # string | required
      authorizer_result_ttl_in_seconds = 0      # number | optional
      identity_validation_expression   = ""     # string | optional

    }

    openid_connect_config { # list [0..1]
      issuer    = ""     # string | required
      auth_ttl  = 0      # number | optional
      client_id = ""     # string | optional
      iat_ttl   = 0      # number | optional

    }

    user_pool_config { # list [0..1]
      user_pool_id        = ""     # string | required
      app_id_client_regex = ""     # string | optional
      aws_region          = ""     # string | optional+computed

    }

  }

  enhanced_metrics_config { # list [0..1]
    data_source_level_metrics_behavior = ""     # string | required
    operation_level_metrics_config     = ""     # string | required
    resolver_level_metrics_behavior    = ""     # string | required

  }

  lambda_authorizer_config { # list [0..1]
    authorizer_uri                   = ""     # string | required
    authorizer_result_ttl_in_seconds = 0      # number | optional
    identity_validation_expression   = ""     # string | optional

  }

  log_config { # list [0..1]
    cloudwatch_logs_role_arn = ""     # string | required
    field_log_level          = ""     # string | required
    exclude_verbose_content  = false  # bool | optional

  }

  openid_connect_config { # list [0..1]
    issuer    = ""     # string | required
    auth_ttl  = 0      # number | optional
    client_id = ""     # string | optional
    iat_ttl   = 0      # number | optional

  }

  user_pool_config { # list [0..1]
    default_action      = ""     # string | required
    user_pool_id        = ""     # string | required
    app_id_client_regex = ""     # string | optional
    aws_region          = ""     # string | optional+computed

  }

}

