# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_eventarc_channel                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_eventarc_channel" "this" {

  location             = ""     # string | required | The location for the resource
  name                 = ""     # string | required | Required. The resource name of the channel. Must be unique w…
  crypto_key_name      = ""     # string | optional | Optional. Resource name of a KMS crypto key (managed by the …
  id                   = ""     # string | optional+computed
  project              = ""     # string | optional+computed | The project for the resource
  third_party_provider = ""     # string | optional | The name of the event provider (e.g. Eventarc SaaS partner) …

  # activation_token     = ""     # string | computed | Output only. The activation token for the channel. The token…
  # create_time          = ""     # string | computed | Output only. The creation time.
  # pubsub_topic         = ""     # string | computed | Output only. The name of the Pub/Sub topic created and manag…
  # state                = ""     # string | computed | Output only. The state of a Channel. Possible values: STATE_…
  # uid                  = ""     # string | computed | Output only. Server assigned unique identifier for the chann…
  # update_time          = ""     # string | computed | Output only. The last-modified time.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

