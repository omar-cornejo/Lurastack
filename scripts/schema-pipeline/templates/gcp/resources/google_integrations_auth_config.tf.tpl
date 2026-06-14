# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_integrations_auth_config                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_integrations_auth_config" "this" {

  display_name                 = ""     # string | required | The name of the auth config.
  location                     = ""     # string | required | Location in which client needs to be provisioned.
  description                  = ""     # string | optional | A description of the auth config.
  expiry_notification_duration = []     # list(string) | optional | User can define the time to receive notification after which…
  id                           = ""     # string | optional+computed
  override_valid_time          = ""     # string | optional | User provided expiry time to override. For the example of Sa…
  project                      = ""     # string | optional+computed
  visibility                   = ""     # string | optional | The visibility of the auth config. Possible values: ["PRIVAT…

  # certificate_id               = ""     # string | computed | Certificate id for client certificate.
  # create_time                  = ""     # string | computed | The timestamp when the auth config is created.  A timestamp …
  # creator_email                = ""     # string | computed | The creator's email address. Generated based on the End User…
  # credential_type              = ""     # string | computed | Credential type of the encrypted credential.
  # encrypted_credential         = ""     # string | computed | Auth credential encrypted by Cloud KMS. Can be decrypted as …
  # last_modifier_email          = ""     # string | computed | The last modifier's email address. Generated based on the En…
  # name                         = ""     # string | computed | Resource name of the auth config.
  # reason                       = ""     # string | computed | The reason / details of the current status.
  # state                        = ""     # string | computed | The status of the auth config.
  # update_time                  = ""     # string | computed | The timestamp when the auth config is modified.  A timestamp…
  # valid_time                   = ""     # string | computed | The time until the auth config is valid. Empty or max value …

  client_certificate { # list [0..1]
    encrypted_private_key = ""     # string | required | The ssl certificate encoded in PEM format. This string must …
    ssl_certificate       = ""     # string | required | The ssl certificate encoded in PEM format. This string must …
    passphrase            = ""     # string | optional | 'passphrase' should be left unset if private key is not encr…

  }

  decrypted_credential { # list [0..1]
    credential_type = ""     # string | required | Credential type associated with auth configs.

    auth_token { # list [0..1]
      token = ""     # string | optional | The token for the auth type.
      type  = ""     # string | optional | Authentication type, e.g. "Basic", "Bearer", etc.

    }

    jwt { # list [0..1]
      jwt_header  = ""     # string | optional | Identifies which algorithm is used to generate the signature…
      jwt_payload = ""     # string | optional | Contains a set of claims. The JWT specification defines seve…
      secret      = ""     # string | optional | User's pre-shared secret to sign the token.

      # jwt         = ""     # string | computed | The token calculated by the header, payload and signature.

    }

    oauth2_authorization_code { # list [0..1]
      auth_endpoint  = ""     # string | optional | The auth url endpoint to send the auth code request to.
      client_id      = ""     # string | optional | The client's id.
      client_secret  = ""     # string | optional | The client's secret.
      scope          = ""     # string | optional | A space-delimited list of requested scope permissions.
      token_endpoint = ""     # string | optional | The token url endpoint to send the token request to.

    }

    oauth2_client_credentials { # list [0..1]
      client_id      = ""     # string | optional | The client's ID.
      client_secret  = ""     # string | optional | The client's secret.
      request_type   = ""     # string | optional | Represent how to pass parameters to fetch access token Possi…
      scope          = ""     # string | optional | A space-delimited list of requested scope permissions.
      token_endpoint = ""     # string | optional | The token endpoint is used by the client to obtain an access…

      token_params { # list [0..1]

        entries { # list

          key { # list [0..1]

            literal_value { # list [0..1]
              string_value = ""     # string | optional | String.

            }

          }

          value { # list [0..1]

            literal_value { # list [0..1]
              string_value = ""     # string | optional | String.

            }

          }

        }

      }

    }

    oidc_token { # list [0..1]
      audience              = ""     # string | optional | Audience to be used when generating OIDC token. The audience…
      service_account_email = ""     # string | optional | The service account email to be used as the identity for the…

      # token                 = ""     # string | computed | ID token obtained for the service account.
      # token_expire_time     = ""     # string | computed | The approximate time until the token retrieved is valid.  A …

    }

    service_account_credentials { # list [0..1]
      scope           = ""     # string | optional | A space-delimited list of requested scope permissions.
      service_account = ""     # string | optional | Name of the service account that has the permission to make …

    }

    username_and_password { # list [0..1]
      password = ""     # string | optional | Password to be used.
      username = ""     # string | optional | Username to be used.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

