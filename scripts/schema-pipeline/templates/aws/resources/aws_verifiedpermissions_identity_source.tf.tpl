# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedpermissions_identity_source             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedpermissions_identity_source" "this" {

  policy_store_id       = ""     # string | required
  principal_entity_type = ""     # string | optional+computed

  # id                    = ""     # string | computed

  configuration { # list

    cognito_user_pool_configuration { # list
      user_pool_arn = ""     # string | required
      client_ids    = []     # list(string) | optional+computed

      group_configuration { # list
        group_entity_type = ""     # string | required

      }

    }

    open_id_connect_configuration { # list
      issuer           = ""     # string | required
      entity_id_prefix = ""     # string | optional

      group_configuration { # list
        group_claim       = ""     # string | required
        group_entity_type = ""     # string | required

      }

      token_selection { # list

        access_token_only { # list
          audiences          = []     # list(string) | optional
          principal_id_claim = ""     # string | optional

        }

        identity_token_only { # list
          client_ids         = []     # list(string) | optional
          principal_id_claim = ""     # string | optional

        }

      }

    }

  }

}

