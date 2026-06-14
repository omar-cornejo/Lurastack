# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_kms_key_ring                                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_kms_key_ring" "this" {

  location = ""     # string | required | The location for the KeyRing. A full list of valid locations…
  name     = ""     # string | required | The resource name for the KeyRing.
  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

