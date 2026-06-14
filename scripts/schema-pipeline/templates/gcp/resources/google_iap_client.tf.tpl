# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_client                                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_client" "this" {

  brand        = ""     # string | required | Identifier of the brand to which this client is attached to.…
  display_name = ""     # string | required | Human-friendly name given to the OAuth client.
  id           = ""     # string | optional+computed

  # client_id    = ""     # string | computed | Output only. Unique identifier of the OAuth client.
  # secret       = ""     # string | computed+sensitive | Output only. Client secret of the OAuth client.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

