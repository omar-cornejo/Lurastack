# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_hmac_key                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_hmac_key" "this" {

  service_account_email = ""     # string | required | The email address of the key's associated service account.
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed
  state                 = ""     # string | optional | The state of the key. Can be set to one of ACTIVE, INACTIVE.…

  # access_id             = ""     # string | computed | The access ID of the HMAC Key.
  # secret                = ""     # string | computed+sensitive | HMAC secret key material.
  # time_created          = ""     # string | computed | 'The creation time of the HMAC key in RFC 3339 format. '
  # updated               = ""     # string | computed | 'The last modification time of the HMAC key metadata in RFC …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

