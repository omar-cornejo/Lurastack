# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_node_group                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_node_group" "this" {

  node_template      = ""     # string | required | The URL of the node template to which this node group belong…
  description        = ""     # string | optional | An optional textual description of the resource.
  id                 = ""     # string | optional+computed
  initial_size       = 0      # number | optional | The initial number of nodes in the node group. One of 'initi…
  maintenance_policy = ""     # string | optional | Specifies how to handle instances when a node in the group u…
  name               = ""     # string | optional | Name of the resource.
  project            = ""     # string | optional+computed
  zone               = ""     # string | optional+computed | Zone where this node group is located

  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # self_link          = ""     # string | computed
  # size               = 0      # number | computed | The total number of nodes in the node group.

  autoscaling_policy { # list [0..1]
    max_nodes = 0      # number | optional+computed | Maximum size of the node group. Set to a value less than or …
    min_nodes = 0      # number | optional+computed | Minimum size of the node group. Must be less than or equal t…
    mode      = ""     # string | optional+computed | The autoscaling mode. Set to one of the following:   - OFF: …

  }

  maintenance_window { # list [0..1]
    start_time = ""     # string | required | instances.start time of the window. This must be in UTC form…

  }

  share_settings { # list [0..1]
    share_type = ""     # string | required | Node group sharing type. Possible values: ["ORGANIZATION", "…

    project_map { # set
      id         = ""     # string | required
      project_id = ""     # string | required | The project id/number should be the same as the key of this …

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

