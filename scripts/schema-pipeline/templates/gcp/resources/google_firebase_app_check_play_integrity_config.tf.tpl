# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebase_app_check_play_integrity_config     │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebase_app_check_play_integrity_config" "this" {

  app_id    = ""     # string | required | The ID of an [Android App](https://firebase.google.com/docs/…
  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed
  token_ttl = ""     # string | optional+computed | Specifies the duration for which App Check tokens exchanged …

  # name      = ""     # string | computed | The relative resource name of the Play Integrity configurati…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

