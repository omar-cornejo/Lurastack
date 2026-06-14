# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_edgenetwork_network                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_edgenetwork_network" "this" {

  location    = ""     # string | required | The Google Cloud region to which the target Distributed Clou…
  network_id  = ""     # string | required | A unique ID that identifies this network.
  zone        = ""     # string | required | The name of the target Distributed Cloud Edge zone.
  description = ""     # string | optional | A free-text description of the resource. Max length 1024 cha…
  id          = ""     # string | optional+computed
  labels      = {}     # map(string) | optional | Labels associated with this resource.
  mtu         = 0      # number | optional | IP (L3) MTU value of the network. Default value is '1500'. P…
  project     = ""     # string | optional+computed

  # create_time = ""     # string | computed | The time when the subnet was created. A timestamp in RFC3339…
  # name        = ""     # string | computed | The canonical name of this resource, with format 'projects/{…
  # update_time = ""     # string | computed | The time when the subnet was last updated. A timestamp in RF…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

