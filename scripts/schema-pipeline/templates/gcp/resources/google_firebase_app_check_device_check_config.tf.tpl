# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebase_app_check_device_check_config       │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebase_app_check_device_check_config" "this" {

  app_id          = ""     # string | required | The ID of an [Apple App](https://firebase.google.com/docs/re…
  key_id          = ""     # string | required | The key identifier of a private key enabled with DeviceCheck…
  private_key     = ""     # string | required+sensitive | The contents of the private key (.p8) file associated with t…
  id              = ""     # string | optional+computed
  project         = ""     # string | optional+computed
  token_ttl       = ""     # string | optional+computed | Specifies the duration for which App Check tokens exchanged …

  # name            = ""     # string | computed | The relative resource name of the DeviceCheck configuration …
  # private_key_set = false  # bool | computed | Whether the privateKey field was previously set. Since App C…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

