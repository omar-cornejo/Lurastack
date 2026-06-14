# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebase_app_check_service_config            │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebase_app_check_service_config" "this" {

  service_id       = ""     # string | required | The identifier of the service to configure enforcement. Curr…
  enforcement_mode = ""     # string | optional | The App Check enforcement mode for a service supported by Ap…
  id               = ""     # string | optional+computed
  project          = ""     # string | optional+computed

  # name             = ""     # string | computed | The fully-qualified resource name of the service enforcement…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

