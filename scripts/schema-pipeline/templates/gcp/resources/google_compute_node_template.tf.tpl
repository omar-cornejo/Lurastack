# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_node_template                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_node_template" "this" {

  cpu_overcommit_type  = ""     # string | optional | CPU overcommit. Default value: "NONE" Possible values: ["ENA…
  description          = ""     # string | optional | An optional textual description of the resource.
  id                   = ""     # string | optional+computed
  name                 = ""     # string | optional | Name of the resource.
  node_affinity_labels = {}     # map(string) | optional | Labels to use for node affinity, which will be used in insta…
  node_type            = ""     # string | optional | Node type to use for nodes group that are created from this …
  project              = ""     # string | optional+computed
  region               = ""     # string | optional+computed | Region where nodes using the node template will be created. …

  # creation_timestamp   = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # self_link            = ""     # string | computed

  node_type_flexibility { # list [0..1]
    cpus      = ""     # string | optional | Number of virtual CPUs to use.
    memory    = ""     # string | optional | Physical memory available to the node, defined in MB.

    # local_ssd = ""     # string | computed | Use local SSD

  }

  server_binding { # list [0..1]
    type = ""     # string | required | Type of server binding policy. If 'RESTART_NODE_ON_ANY_SERVE…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

