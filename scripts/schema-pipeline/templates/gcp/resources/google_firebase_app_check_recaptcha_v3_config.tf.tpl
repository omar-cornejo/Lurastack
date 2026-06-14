# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebase_app_check_recaptcha_v3_config       │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebase_app_check_recaptcha_v3_config" "this" {

  app_id          = ""     # string | required | The ID of an [Web App](https://firebase.google.com/docs/refe…
  site_secret     = ""     # string | required+sensitive | The site secret used to identify your service for reCAPTCHA …
  id              = ""     # string | optional+computed
  project         = ""     # string | optional+computed
  token_ttl       = ""     # string | optional+computed | Specifies the duration for which App Check tokens exchanged …

  # name            = ""     # string | computed | The relative resource name of the reCAPTCHA V3 configuration…
  # site_secret_set = false  # bool | computed | Whether the siteSecret was previously set. Since we will nev…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

