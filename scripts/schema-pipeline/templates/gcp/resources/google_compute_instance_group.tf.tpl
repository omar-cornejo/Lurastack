# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance_group                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance_group" "this" {

  name        = ""     # string | required | The name of the instance group. Must be 1-63 characters long…
  description = ""     # string | optional | An optional textual description of the instance group.
  id          = ""     # string | optional+computed
  instances   = []     # set(string) | optional+computed | The list of instances in the group, in self_link format. Whe…
  network     = ""     # string | optional+computed | The URL of the network the instance group is in. If this is …
  project     = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  zone        = ""     # string | optional+computed | The zone that this instance group should be created in.

  # self_link   = ""     # string | computed | The URI of the created resource.
  # size        = 0      # number | computed | The number of instances in the group.

  named_port { # list
    name = ""     # string | required | The name which the port will be mapped to.
    port = 0      # number | required | The port number to map the name to.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

