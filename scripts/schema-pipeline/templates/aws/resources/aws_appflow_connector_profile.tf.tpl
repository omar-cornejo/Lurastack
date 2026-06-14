# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appflow_connector_profile                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appflow_connector_profile" "this" {

  connection_mode = ""     # string | required
  connector_type  = ""     # string | required
  name            = ""     # string | required
  connector_label = ""     # string | optional
  id              = ""     # string | optional+computed
  kms_arn         = ""     # string | optional+computed

  # arn             = ""     # string | computed
  # credentials_arn = ""     # string | computed

  connector_profile_config { # list [1..1]

    connector_profile_credentials { # list [1..1]

      amplitude { # list [0..1]
        api_key    = ""     # string | required
        secret_key = ""     # string | required+sensitive

      }

      custom_connector { # list [0..1]
        authentication_type = ""     # string | required

        api_key { # list [0..1]
          api_key        = ""     # string | required
          api_secret_key = ""     # string | optional

        }

        basic { # list [0..1]
          password = ""     # string | required+sensitive
          username = ""     # string | required

        }

        custom { # list [0..1]
          custom_authentication_type = ""     # string | required
          credentials_map            = {}     # map(string) | optional+sensitive

        }

        oauth2 { # list [0..1]
          access_token  = ""     # string | optional+sensitive
          client_id     = ""     # string | optional
          client_secret = ""     # string | optional+sensitive
          refresh_token = ""     # string | optional

          oauth_request { # list [0..1]
            auth_code    = ""     # string | optional
            redirect_uri = ""     # string | optional

          }

        }

      }

      datadog { # list [0..1]
        api_key         = ""     # string | required
        application_key = ""     # string | required

      }

      dynatrace { # list [0..1]
        api_token = ""     # string | required

      }

      google_analytics { # list [0..1]
        client_id     = ""     # string | required
        client_secret = ""     # string | required+sensitive
        access_token  = ""     # string | optional+sensitive
        refresh_token = ""     # string | optional

        oauth_request { # list [0..1]
          auth_code    = ""     # string | optional
          redirect_uri = ""     # string | optional

        }

      }

      honeycode { # list [0..1]
        access_token  = ""     # string | optional+sensitive
        refresh_token = ""     # string | optional

        oauth_request { # list [0..1]
          auth_code    = ""     # string | optional
          redirect_uri = ""     # string | optional

        }

      }

      infor_nexus { # list [0..1]
        access_key_id     = ""     # string | required
        datakey           = ""     # string | required
        secret_access_key = ""     # string | required+sensitive
        user_id           = ""     # string | required

      }

      marketo { # list [0..1]
        client_id     = ""     # string | required
        client_secret = ""     # string | required+sensitive
        access_token  = ""     # string | optional+sensitive

        oauth_request { # list [0..1]
          auth_code    = ""     # string | optional
          redirect_uri = ""     # string | optional

        }

      }

      redshift { # list [0..1]
        password = ""     # string | required+sensitive
        username = ""     # string | required

      }

      salesforce { # list [0..1]
        access_token           = ""     # string | optional+sensitive
        client_credentials_arn = ""     # string | optional
        jwt_token              = ""     # string | optional
        oauth2_grant_type      = ""     # string | optional
        refresh_token          = ""     # string | optional

        oauth_request { # list [0..1]
          auth_code    = ""     # string | optional
          redirect_uri = ""     # string | optional

        }

      }

      sapo_data { # list [0..1]

        basic_auth_credentials { # list [0..1]
          password = ""     # string | required+sensitive
          username = ""     # string | required

        }

        oauth_credentials { # list [0..1]
          client_id     = ""     # string | required
          client_secret = ""     # string | required
          access_token  = ""     # string | optional+sensitive
          refresh_token = ""     # string | optional

          oauth_request { # list [0..1]
            auth_code    = ""     # string | optional
            redirect_uri = ""     # string | optional

          }

        }

      }

      service_now { # list [0..1]
        password = ""     # string | required+sensitive
        username = ""     # string | required

      }

      singular { # list [0..1]
        api_key = ""     # string | required

      }

      slack { # list [0..1]
        client_id     = ""     # string | required
        client_secret = ""     # string | required+sensitive
        access_token  = ""     # string | optional+sensitive

        oauth_request { # list [0..1]
          auth_code    = ""     # string | optional
          redirect_uri = ""     # string | optional

        }

      }

      snowflake { # list [0..1]
        password = ""     # string | required+sensitive
        username = ""     # string | required

      }

      trendmicro { # list [0..1]
        api_secret_key = ""     # string | required+sensitive

      }

      veeva { # list [0..1]
        password = ""     # string | required+sensitive
        username = ""     # string | required

      }

      zendesk { # list [0..1]
        client_id     = ""     # string | required
        client_secret = ""     # string | required+sensitive
        access_token  = ""     # string | optional+sensitive

        oauth_request { # list [0..1]
          auth_code    = ""     # string | optional
          redirect_uri = ""     # string | optional

        }

      }

    }

    connector_profile_properties { # list [1..1]

      amplitude {} # list [0..1]

      custom_connector { # list [0..1]
        profile_properties = {}     # map(string) | optional

        oauth2_properties { # list [0..1]
          oauth2_grant_type           = ""     # string | required
          token_url                   = ""     # string | required
          token_url_custom_properties = {}     # map(string) | optional

        }

      }

      datadog { # list [0..1]
        instance_url = ""     # string | required

      }

      dynatrace { # list [0..1]
        instance_url = ""     # string | required

      }

      google_analytics {} # list [0..1]

      honeycode {} # list [0..1]

      infor_nexus { # list [0..1]
        instance_url = ""     # string | required

      }

      marketo { # list [0..1]
        instance_url = ""     # string | required

      }

      redshift { # list [0..1]
        bucket_name        = ""     # string | required
        role_arn           = ""     # string | required
        bucket_prefix      = ""     # string | optional
        cluster_identifier = ""     # string | optional
        data_api_role_arn  = ""     # string | optional
        database_name      = ""     # string | optional
        database_url       = ""     # string | optional

      }

      salesforce { # list [0..1]
        instance_url                                   = ""     # string | optional
        is_sandbox_environment                         = false  # bool | optional
        use_privatelink_for_metadata_and_authorization = false  # bool | optional

      }

      sapo_data { # list [0..1]
        application_host_url      = ""     # string | required
        application_service_path  = ""     # string | required
        client_number             = ""     # string | required
        port_number               = 0      # number | required
        logon_language            = ""     # string | optional
        private_link_service_name = ""     # string | optional

        oauth_properties { # list [0..1]
          auth_code_url = ""     # string | required
          oauth_scopes  = []     # list(string) | required
          token_url     = ""     # string | required

        }

      }

      service_now { # list [0..1]
        instance_url = ""     # string | required

      }

      singular {} # list [0..1]

      slack { # list [0..1]
        instance_url = ""     # string | required

      }

      snowflake { # list [0..1]
        bucket_name               = ""     # string | required
        stage                     = ""     # string | required
        warehouse                 = ""     # string | required
        account_name              = ""     # string | optional
        bucket_prefix             = ""     # string | optional
        private_link_service_name = ""     # string | optional
        region                    = ""     # string | optional

      }

      trendmicro {} # list [0..1]

      veeva { # list [0..1]
        instance_url = ""     # string | required

      }

      zendesk { # list [0..1]
        instance_url = ""     # string | required

      }

    }

  }

}

