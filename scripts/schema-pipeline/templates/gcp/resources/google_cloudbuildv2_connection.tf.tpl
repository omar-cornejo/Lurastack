# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloudbuildv2_connection                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloudbuildv2_connection" "this" {

  location              = ""     # string | required | The location for the resource
  name                  = ""     # string | required | Immutable. The resource name of the connection.
  annotations           = {}     # map(string) | optional | Allows clients to store small amounts of arbitrary data.  **…
  disabled              = false  # bool | optional | If disabled is set to true, functionality is disabled for th…
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | Output only. Server assigned timestamp for when the connecti…
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # etag                  = ""     # string | computed | This checksum is computed by the server based on the value o…
  # installation_state = [  # list(object)
  #   {
  #     action_uri = ""
  #     message = ""
  #     stage = ""
  #   }
  # ]
  # reconciling           = false  # bool | computed | Output only. Set to true when the connection is being set up…
  # update_time           = ""     # string | computed | Output only. Server assigned timestamp for when the connecti…

  bitbucket_cloud_config { # list [0..1]
    webhook_secret_secret_version = ""     # string | required | Required. Immutable. SecretManager resource containing the w…
    workspace                     = ""     # string | required | The Bitbucket Cloud Workspace ID to be connected to Google C…

    authorizer_credential { # list [1..1]
      user_token_secret_version = ""     # string | required | Required. A SecretManager resource containing the user token…

      # username                  = ""     # string | computed | Output only. The username associated to this token.

    }

    read_authorizer_credential { # list [1..1]
      user_token_secret_version = ""     # string | required | Required. A SecretManager resource containing the user token…

      # username                  = ""     # string | computed | Output only. The username associated to this token.

    }

  }

  bitbucket_data_center_config { # list [0..1]
    host_uri                      = ""     # string | required | The URI of the Bitbucket Data Center host this connection is…
    webhook_secret_secret_version = ""     # string | required | Required. Immutable. SecretManager resource containing the w…
    ssl_ca                        = ""     # string | optional | SSL certificate to use for requests to the Bitbucket Data Ce…

    # server_version                = ""     # string | computed | Output only. Version of the Bitbucket Data Center running on…

    authorizer_credential { # list [1..1]
      user_token_secret_version = ""     # string | required | Required. A SecretManager resource containing the user token…

      # username                  = ""     # string | computed | Output only. The username associated to this token.

    }

    read_authorizer_credential { # list [1..1]
      user_token_secret_version = ""     # string | required | Required. A SecretManager resource containing the user token…

      # username                  = ""     # string | computed | Output only. The username associated to this token.

    }

    service_directory_config { # list [0..1]
      service = ""     # string | required | Required. The Service Directory service name. Format: projec…

    }

  }

  github_config { # list [0..1]
    app_installation_id = 0      # number | optional | GitHub App installation id.

    authorizer_credential { # list [0..1]
      oauth_token_secret_version = ""     # string | optional | A SecretManager resource containing the OAuth token that aut…

      # username                   = ""     # string | computed | Output only. The username associated to this token.

    }

  }

  github_enterprise_config { # list [0..1]
    host_uri                      = ""     # string | required | Required. The URI of the GitHub Enterprise host this connect…
    app_id                        = 0      # number | optional | Id of the GitHub App created from the manifest.
    app_installation_id           = 0      # number | optional | ID of the installation of the GitHub App.
    app_slug                      = ""     # string | optional | The URL-friendly name of the GitHub App.
    private_key_secret_version    = ""     # string | optional | SecretManager resource containing the private key of the Git…
    ssl_ca                        = ""     # string | optional | SSL certificate to use for requests to GitHub Enterprise.
    webhook_secret_secret_version = ""     # string | optional | SecretManager resource containing the webhook secret of the …

    service_directory_config { # list [0..1]
      service = ""     # string | required | Required. The Service Directory service name. Format: projec…

    }

  }

  gitlab_config { # list [0..1]
    webhook_secret_secret_version = ""     # string | required | Required. Immutable. SecretManager resource containing the w…
    host_uri                      = ""     # string | optional+computed | The URI of the GitLab Enterprise host this connection is for…
    ssl_ca                        = ""     # string | optional | SSL certificate to use for requests to GitLab Enterprise.

    # server_version                = ""     # string | computed | Output only. Version of the GitLab Enterprise server running…

    authorizer_credential { # list [1..1]
      user_token_secret_version = ""     # string | required | Required. A SecretManager resource containing the user token…

      # username                  = ""     # string | computed | Output only. The username associated to this token.

    }

    read_authorizer_credential { # list [1..1]
      user_token_secret_version = ""     # string | required | Required. A SecretManager resource containing the user token…

      # username                  = ""     # string | computed | Output only. The username associated to this token.

    }

    service_directory_config { # list [0..1]
      service = ""     # string | required | Required. The Service Directory service name. Format: projec…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

