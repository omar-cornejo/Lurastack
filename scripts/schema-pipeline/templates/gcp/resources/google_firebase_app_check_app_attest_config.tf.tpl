# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebase_app_check_app_attest_config         │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebase_app_check_app_attest_config" "this" {

  app_id    = ""     # string | required | The ID of an [Apple App](https://firebase.google.com/docs/re…
  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed
  token_ttl = ""     # string | optional+computed | Specifies the duration for which App Check tokens exchanged …

  # name      = ""     # string | computed | The relative resource name of the App Attest configuration o…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

