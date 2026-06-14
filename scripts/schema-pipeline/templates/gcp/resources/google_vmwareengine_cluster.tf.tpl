# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vmwareengine_cluster                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_vmwareengine_cluster" "this" {

  name       = ""     # string | required | The ID of the Cluster.
  parent     = ""     # string | required | The resource name of the private cloud to create a new clust…
  id         = ""     # string | optional+computed

  # management = false  # bool | computed | True if the cluster is a management cluster; false otherwise…
  # state      = ""     # string | computed | State of the Cluster.
  # uid        = ""     # string | computed | System-generated unique identifier for the resource.

  node_type_configs { # set
    node_count        = 0      # number | required | The number of nodes of this type in the cluster.
    node_type_id      = ""     # string | required
    custom_core_count = 0      # number | optional | Customized number of cores available to each node of the typ…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

