# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebase_app_check_debug_token               │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebase_app_check_debug_token" "this" {

  app_id         = ""     # string | required | The ID of a [Web App](https://firebase.google.com/docs/refer…
  display_name   = ""     # string | required | A human readable display name used to identify this debug to…
  token          = ""     # string | required+sensitive | The secret token itself. Must be provided during creation, a…
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  # debug_token_id = ""     # string | computed | The last segment of the resource name of the debug token.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

