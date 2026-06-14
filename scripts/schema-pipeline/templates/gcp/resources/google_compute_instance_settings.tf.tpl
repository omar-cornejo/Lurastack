# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance_settings                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance_settings" "this" {

  zone        = ""     # string | required | A reference to the zone where the machine resides.
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # fingerprint = ""     # string | computed | The fingerprint used for optimistic locking of this resource…

  metadata { # list [0..1]
    items = {}     # map(string) | optional | A metadata key/value items map. The total size of all keys a…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

