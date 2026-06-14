# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_integration_connectors_connection            │
# └──────────────────────────────────────────────────────────────┘
resource "google_integration_connectors_connection" "this" {

  connector_version              = ""     # string | required | connectorVersion of the Connector.
  location                       = ""     # string | required | Location in which Connection needs to be created.
  name                           = ""     # string | required | Name of Connection needs to be created.
  description                    = ""     # string | optional | An arbitrary description for the Conection.
  eventing_enablement_type       = ""     # string | optional | Eventing enablement type. Will be nil if eventing is not ena…
  id                             = ""     # string | optional+computed
  labels                         = {}     # map(string) | optional | Resource labels to represent user provided metadata.   **Not…
  project                        = ""     # string | optional+computed
  service_account                = ""     # string | optional+computed | Service account needed for runtime plane to access Google Cl…
  suspended                      = false  # bool | optional | Suspended indicates if a user has suspended a connection or …

  # connection_revision            = ""     # string | computed | Connection revision. This field is only updated when the con…
  # connector_version_infra_config = [  # list(object)
  #   {
  #     ratelimit_threshold = ""
  #   }
  # ]
  # connector_version_launch_stage = ""     # string | computed | Flag to mark the version indicating the launch stage.
  # create_time                    = ""     # string | computed | Time the Namespace was created in UTC.
  # effective_labels               = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # eventing_runtime_data = [  # list(object)
  #   {
  #     events_listener_endpoint = ""
  #     status = [  # list(object)
  #       {
  #         description = ""
  #         state = ""
  #       }
  #     ]
  #   }
  # ]
  # service_directory              = ""     # string | computed | The name of the Service Directory service name. Used for Pri…
  # status = [  # list(object)
  #   {
  #     description = ""
  #     state = ""
  #     status = ""
  #   }
  # ]
  # subscription_type              = ""     # string | computed | This subscription type enum states the subscription type of …
  # terraform_labels               = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time                    = ""     # string | computed | Time the Namespace was updated in UTC.

  auth_config { # list [0..1]
    auth_type = ""     # string | required | authType of the Connection Possible values: ["USER_PASSWORD"…
    auth_key  = ""     # string | optional | The type of authentication configured.

    additional_variable { # list
      key           = ""     # string | required | Key for the configVariable
      boolean_value = false  # bool | optional | Boolean Value of configVariable.
      integer_value = 0      # number | optional | Integer Value of configVariable.
      string_value  = ""     # string | optional | String Value of configVariabley.

      encryption_key_value { # list [0..1]
        type         = ""     # string | required | Type of Encription Key Possible values: ["GOOGLE_MANAGED", "…
        kms_key_name = ""     # string | optional | The [KMS key name] with which the content of the Operation i…

      }

      secret_value { # list [0..1]
        secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

      }

    }

    oauth2_auth_code_flow { # list [0..1]
      auth_uri    = ""     # string | optional | Auth URL for Authorization Code Flow.
      client_id   = ""     # string | optional | Client ID for user-provided OAuth app.
      enable_pkce = false  # bool | optional | Whether to enable PKCE when the user performs the auth code …
      scopes      = []     # list(string) | optional | Scopes the connection will request when the user performs th…

      client_secret { # list [0..1]
        secret_version = ""     # string | required | The resource name of the secret version in the format, forma…

      }

    }

    oauth2_client_credentials { # list [0..1]
      client_id = ""     # string | required | Secret version of Password for Authentication.

      client_secret { # list [0..1]
        secret_version = ""     # string | required | The resource name of the secret version in the format, forma…

      }

    }

    oauth2_jwt_bearer { # list [0..1]

      client_key { # list [0..1]
        secret_version = ""     # string | required | The resource name of the secret version in the format, forma…

      }

      jwt_claims { # list [0..1]
        audience = ""     # string | optional | Value for the "aud" claim.
        issuer   = ""     # string | optional | Value for the "iss" claim.
        subject  = ""     # string | optional | Value for the "sub" claim.

      }

    }

    ssh_public_key { # list [0..1]
      username  = ""     # string | required | The user account used to authenticate.
      cert_type = ""     # string | optional | Format of SSH Client cert.

      ssh_client_cert { # list [0..1]
        secret_version = ""     # string | required | The resource name of the secret version in the format, forma…

      }

      ssh_client_cert_pass { # list [0..1]
        secret_version = ""     # string | required | The resource name of the secret version in the format, forma…

      }

    }

    user_password { # list [0..1]
      username = ""     # string | required | Username for Authentication.

      password { # list [0..1]
        secret_version = ""     # string | required | The resource name of the secret version in the format, forma…

      }

    }

  }

  config_variable { # list
    key           = ""     # string | required | Key for the configVariable
    boolean_value = false  # bool | optional | Boolean Value of configVariable
    integer_value = 0      # number | optional | Integer Value of configVariable
    string_value  = ""     # string | optional | String Value of configVariabley

    encryption_key_value { # list [0..1]
      type         = ""     # string | required | Type of Encription Key Possible values: ["GOOGLE_MANAGED", "…
      kms_key_name = ""     # string | optional | The [KMS key name] with which the content of the Operation i…

    }

    secret_value { # list [0..1]
      secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

    }

  }

  destination_config { # list
    key = ""     # string | required | The key is the destination identifier that is supported by t…

    destination { # list
      host               = ""     # string | optional | For publicly routable host.
      port               = 0      # number | optional | The port is the target port number that is accepted by the d…
      service_attachment = ""     # string | optional | PSC service attachments. Format: projects/*/regions/*/servic…

    }

  }

  eventing_config { # list [0..1]
    enrichment_enabled = false  # bool | optional | Enrichment Enabled.

    additional_variable { # list
      key           = ""     # string | required | Key for the configVariable
      boolean_value = false  # bool | optional | Boolean Value of configVariable.
      integer_value = 0      # number | optional | Integer Value of configVariable.
      string_value  = ""     # string | optional | String Value of configVariabley.

      encryption_key_value { # list [0..1]
        kms_key_name = ""     # string | optional | The [KMS key name] with which the content of the Operation i…
        type         = ""     # string | optional | Type of Encryption Key Possible values: ["GOOGLE_MANAGED", "…

      }

      secret_value { # list [0..1]
        secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

      }

    }

    auth_config { # list [0..1]
      auth_type = ""     # string | required | authType of the Connection Possible values: ["USER_PASSWORD"…
      auth_key  = ""     # string | optional | The type of authentication configured.

      additional_variable { # list
        key           = ""     # string | required | Key for the configVariable
        boolean_value = false  # bool | optional | Boolean Value of configVariable.
        integer_value = 0      # number | optional | Integer Value of configVariable.
        string_value  = ""     # string | optional | String Value of configVariabley.

        encryption_key_value { # list [0..1]
          kms_key_name = ""     # string | optional | The [KMS key name] with which the content of the Operation i…
          type         = ""     # string | optional | Type of Encription Key Possible values: ["GOOGLE_MANAGED", "…

        }

        secret_value { # list [0..1]
          secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

        }

      }

      user_password { # list [1..1]
        username = ""     # string | optional | Username for Authentication.

        password { # list [0..1]
          secret_version = ""     # string | required | The resource name of the secret version in the format, forma…

        }

      }

    }

    registration_destination_config { # list [1..1]
      key = ""     # string | optional | Key for the connection

      destination { # list
        host               = ""     # string | optional | Host
        port               = 0      # number | optional | port number
        service_attachment = ""     # string | optional | Service Attachment

      }

    }

  }

  lock_config { # list [0..1]
    locked = false  # bool | required | Indicates whether or not the connection is locked.
    reason = ""     # string | optional | Describes why a connection is locked.

  }

  log_config { # list [0..1]
    enabled = false  # bool | required | Enabled represents whether logging is enabled or not for a c…

  }

  node_config { # list [0..1]
    max_node_count = 0      # number | optional+computed | Minimum number of nodes in the runtime nodes.
    min_node_count = 0      # number | optional+computed | Minimum number of nodes in the runtime nodes.

  }

  ssl_config { # list [0..1]
    type             = ""     # string | required | Enum for controlling the SSL Type (TLS/MTLS) Possible values…
    client_cert_type = ""     # string | optional | Type of Client Cert (PEM/JKS/.. etc.) Possible values: ["PEM…
    server_cert_type = ""     # string | optional | Type of Server Cert (PEM/JKS/.. etc.) Possible values: ["PEM…
    trust_model      = ""     # string | optional | Enum for Trust Model Possible values: ["PUBLIC", "PRIVATE", …
    use_ssl          = false  # bool | optional | Bool for enabling SSL

    additional_variable { # list
      key           = ""     # string | required | Key for the configVariable
      boolean_value = false  # bool | optional | Boolean Value of configVariable.
      integer_value = 0      # number | optional | Integer Value of configVariable.
      string_value  = ""     # string | optional | String Value of configVariabley.

      encryption_key_value { # list [0..1]
        kms_key_name = ""     # string | optional | The [KMS key name] with which the content of the Operation i…
        type         = ""     # string | optional | Type of Encription Key Possible values: ["GOOGLE_MANAGED", "…

      }

      secret_value { # list [0..1]
        secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

      }

    }

    client_certificate { # list [0..1]
      secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

    }

    client_private_key { # list [0..1]
      secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

    }

    client_private_key_pass { # list [0..1]
      secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

    }

    private_server_certificate { # list [0..1]
      secret_version = ""     # string | required | Secret version of Secret Value for Config variable.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

