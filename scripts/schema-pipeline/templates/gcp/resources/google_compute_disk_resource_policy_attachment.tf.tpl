# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_disk_resource_policy_attachment      │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_disk_resource_policy_attachment" "this" {

  disk    = ""     # string | required | The name of the disk in which the resource policies are atta…
  name    = ""     # string | required | The resource policy to be attached to the disk for schedulin…
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  zone    = ""     # string | optional+computed | A reference to the zone where the disk resides.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

