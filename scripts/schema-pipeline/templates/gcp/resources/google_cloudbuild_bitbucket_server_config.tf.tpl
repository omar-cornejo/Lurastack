# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloudbuild_bitbucket_server_config           │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloudbuild_bitbucket_server_config" "this" {

  api_key        = ""     # string | required | Immutable. API Key that will be attached to webhook. Once th…
  config_id      = ""     # string | required | The ID to use for the BitbucketServerConfig, which will beco…
  host_uri       = ""     # string | required | Immutable. The URI of the Bitbucket Server host. Once this f…
  location       = ""     # string | required | The location of this bitbucket server config.
  username       = ""     # string | required | Username of the account Cloud Build will use on Bitbucket Se…
  id             = ""     # string | optional+computed
  peered_network = ""     # string | optional | The network to be used when reaching out to the Bitbucket Se…
  project        = ""     # string | optional+computed
  ssl_ca         = ""     # string | optional | SSL certificate to use for requests to Bitbucket Server. The…

  # name           = ""     # string | computed | The resource name for the config.
  # webhook_key    = ""     # string | computed | Output only. UUID included in webhook requests. The UUID is …

  connected_repositories { # set
    project_key = ""     # string | required | Identifier for the project storing the repository.
    repo_slug   = ""     # string | required | Identifier for the repository.

  }

  secrets { # list [1..1]
    admin_access_token_version_name = ""     # string | required | The resource name for the admin access token's secret versio…
    read_access_token_version_name  = ""     # string | required | The resource name for the read access token's secret version…
    webhook_secret_version_name     = ""     # string | required | Immutable. The resource name for the webhook secret's secret…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

