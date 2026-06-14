# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_eventarc_google_channel_config               │
# └──────────────────────────────────────────────────────────────┘
resource "google_eventarc_google_channel_config" "this" {

  location        = ""     # string | required | The location for the resource
  name            = ""     # string | required | Required. The resource name of the config. Must be in the fo…
  crypto_key_name = ""     # string | optional | Optional. Resource name of a KMS crypto key (managed by the …
  id              = ""     # string | optional+computed
  project         = ""     # string | optional+computed | The project for the resource

  # update_time     = ""     # string | computed | Output only. The last-modified time.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

