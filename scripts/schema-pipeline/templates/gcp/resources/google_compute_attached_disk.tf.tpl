# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_attached_disk                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_attached_disk" "this" {

  disk        = ""     # string | required | name or self_link of the disk that will be attached.
  instance    = ""     # string | required | name or self_link of the compute instance that the disk will…
  device_name = ""     # string | optional+computed | Specifies a unique device name of your choice that is reflec…
  id          = ""     # string | optional+computed
  mode        = ""     # string | optional | The mode in which to attach this disk, either READ_WRITE or …
  project     = ""     # string | optional+computed | The project that the referenced compute instance is a part o…
  zone        = ""     # string | optional+computed | The zone that the referenced compute instance is located wit…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

