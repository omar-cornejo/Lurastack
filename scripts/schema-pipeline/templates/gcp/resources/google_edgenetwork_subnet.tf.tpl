# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_edgenetwork_subnet                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_edgenetwork_subnet" "this" {

  location    = ""     # string | required | The Google Cloud region to which the target Distributed Clou…
  network     = ""     # string | required | The ID of the network to which this router belongs. Must be …
  subnet_id   = ""     # string | required | A unique ID that identifies this subnet.
  zone        = ""     # string | required | The name of the target Distributed Cloud Edge zone.
  description = ""     # string | optional | A free-text description of the resource. Max length 1024 cha…
  id          = ""     # string | optional+computed
  ipv4_cidr   = []     # list(string) | optional | The ranges of ipv4 addresses that are owned by this subnetwo…
  ipv6_cidr   = []     # list(string) | optional | The ranges of ipv6 addresses that are owned by this subnetwo…
  labels      = {}     # map(string) | optional | Labels associated with this resource.
  project     = ""     # string | optional+computed
  vlan_id     = 0      # number | optional+computed | VLAN ID for this subnetwork. If not specified, one is assign…

  # create_time = ""     # string | computed | The time when the subnet was created. A timestamp in RFC3339…
  # name        = ""     # string | computed | The canonical name of this resource, with format 'projects/{…
  # state       = ""     # string | computed | Current stage of the resource to the device by config push.
  # update_time = ""     # string | computed | The time when the subnet was last updated. A timestamp in RF…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

