# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebase_app_check_recaptcha_enterprise_config  │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebase_app_check_recaptcha_enterprise_config" "this" {

  app_id    = ""     # string | required | The ID of an [Web App](https://firebase.google.com/docs/refe…
  site_key  = ""     # string | required | The score-based site key created in reCAPTCHA Enterprise use…
  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed
  token_ttl = ""     # string | optional+computed | Specifies the duration for which App Check tokens exchanged …

  # name      = ""     # string | computed | The relative resource name of the reCAPTCHA Enterprise confi…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

