# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gkeonprem_bare_metal_node_pool               │
# └──────────────────────────────────────────────────────────────┘
resource "google_gkeonprem_bare_metal_node_pool" "this" {

  bare_metal_cluster    = ""     # string | required | The cluster this node pool belongs to.
  location              = ""     # string | required | The location of the resource.
  name                  = ""     # string | required | The bare metal node pool name.
  annotations           = {}     # map(string) | optional | Annotations on the Bare Metal Node Pool. This field has the …
  display_name          = ""     # string | optional | The display name for the Bare Metal Node Pool.
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | The time the cluster was created, in RFC3339 text format.
  # delete_time           = ""     # string | computed | The time the cluster was deleted, in RFC3339 text format.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # etag                  = ""     # string | computed | This checksum is computed by the server based on the value o…
  # reconciling           = false  # bool | computed | If set, there are currently changes in flight to the Bare Me…
  # state                 = ""     # string | computed | The current state of this cluster.
  # status = [  # list(object)
  #   {
  #     conditions = [  # list(object)
  #       {
  #         last_transition_time = ""
  #         message = ""
  #         reason = ""
  #         state = ""
  #         type = ""
  #       }
  #     ]
  #     error_message = ""
  #   }
  # ]
  # uid                   = ""     # string | computed | The unique identifier of the Bare Metal Node Pool.
  # update_time           = ""     # string | computed | The time the cluster was last updated, in RFC3339 text forma…

  node_pool_config { # list [1..1]
    labels           = {}     # map(string) | optional+computed | The map of Kubernetes labels (key/value pairs) to be applied…
    operating_system = ""     # string | optional+computed | Specifies the nodes operating system (default: LINUX).

    node_configs { # list [1..*]
      labels  = {}     # map(string) | optional | The map of Kubernetes labels (key/value pairs) to be applied…
      node_ip = ""     # string | optional | The default IPv4 address for SSH access and Kubernetes node.…

    }

    taints { # list
      effect = ""     # string | optional | Specifies the nodes operating system (default: LINUX). Possi…
      key    = ""     # string | optional | Key associated with the effect.
      value  = ""     # string | optional | Value associated with the effect.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

