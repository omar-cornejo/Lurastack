# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_app_engine_application                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_app_engine_application" "this" {

  location_id       = ""     # string | required | The location to serve the app from.
  auth_domain       = ""     # string | optional+computed | The domain to authenticate users with when using App Engine'…
  database_type     = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  project           = ""     # string | optional+computed | The project ID to create the application under.
  serving_status    = ""     # string | optional+computed | The serving status of the app.

  # app_id            = ""     # string | computed | Identifier of the app.
  # code_bucket       = ""     # string | computed | The GCS bucket code is being stored in for this app.
  # default_bucket    = ""     # string | computed | The GCS bucket content is being stored in for this app.
  # default_hostname  = ""     # string | computed | The default hostname for this app.
  # gcr_domain        = ""     # string | computed | The GCR domain used for storing managed Docker images for th…
  # name              = ""     # string | computed | Unique name of the app.
  # url_dispatch_rule = [  # list(object)
  #   {
  #     domain = ""
  #     path = ""
  #     service = ""
  #   }
  # ]

  feature_settings { # list [0..1]
    split_health_checks = false  # bool | required

  }

  iap { # list [0..1]
    oauth2_client_id            = ""     # string | required | OAuth2 client ID to use for the authentication flow.
    oauth2_client_secret        = ""     # string | required+sensitive | OAuth2 client secret to use for the authentication flow. The…
    enabled                     = false  # bool | optional | Adapted for use with the app

    # oauth2_client_secret_sha256 = ""     # string | computed+sensitive | Hex-encoded SHA-256 hash of the client secret.

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

