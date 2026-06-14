# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_iap_client                                       │
# └──────────────────────────────────────────────────────────────┘
data "google_iap_client" "this" {

  brand        = ""     # string | required | Identifier of the brand to which this client is attached to.…
  client_id    = ""     # string | required | Output only. Unique identifier of the OAuth client.
  id           = ""     # string | optional+computed

  # display_name = ""     # string | computed | Human-friendly name given to the OAuth client.
  # secret       = ""     # string | computed | Output only. Client secret of the OAuth client.

}

