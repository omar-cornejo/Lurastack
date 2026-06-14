# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_connection                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_connection" "this" {

  authorization_type = ""     # string | required
  name               = ""     # string | required
  description        = ""     # string | optional
  id                 = ""     # string | optional+computed
  kms_key_identifier = ""     # string | optional

  # arn                = ""     # string | computed
  # secret_arn         = ""     # string | computed

  auth_parameters { # list [1..1]

    api_key { # list [0..1]
      key   = ""     # string | required
      value = ""     # string | required+sensitive

    }

    basic { # list [0..1]
      password = ""     # string | required+sensitive
      username = ""     # string | required

    }

    invocation_http_parameters { # list [0..1]

      body { # list
        is_value_secret = false  # bool | optional
        key             = ""     # string | optional
        value           = ""     # string | optional+sensitive

      }

      header { # list
        is_value_secret = false  # bool | optional
        key             = ""     # string | optional
        value           = ""     # string | optional+sensitive

      }

      query_string { # list
        is_value_secret = false  # bool | optional
        key             = ""     # string | optional
        value           = ""     # string | optional+sensitive

      }

    }

    oauth { # list [0..1]
      authorization_endpoint = ""     # string | required
      http_method            = ""     # string | required

      client_parameters { # list [0..1]
        client_id     = ""     # string | required
        client_secret = ""     # string | required+sensitive

      }

      oauth_http_parameters { # list [1..1]

        body { # list
          is_value_secret = false  # bool | optional
          key             = ""     # string | optional
          value           = ""     # string | optional+sensitive

        }

        header { # list
          is_value_secret = false  # bool | optional
          key             = ""     # string | optional
          value           = ""     # string | optional+sensitive

        }

        query_string { # list
          is_value_secret = false  # bool | optional
          key             = ""     # string | optional
          value           = ""     # string | optional+sensitive

        }

      }

    }

  }

  invocation_connectivity_parameters { # list [0..1]

    resource_parameters { # list [1..1]
      resource_configuration_arn = ""     # string | required

      # resource_association_arn   = ""     # string | computed

    }

  }

}

