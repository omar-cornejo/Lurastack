# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_disk_resource_policy_attachment  │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_disk_resource_policy_attachment" "this" {

  disk    = ""     # string | required | The name of the regional disk in which the resource policies…
  name    = ""     # string | required | The resource policy to be attached to the disk for schedulin…
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  region  = ""     # string | optional+computed | A reference to the region where the disk resides.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

