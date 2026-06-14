# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gkeonprem_vmware_node_pool                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_gkeonprem_vmware_node_pool" "this" {

  location              = ""     # string | required | The location of the resource.
  name                  = ""     # string | required | The vmware node pool name.
  vmware_cluster        = ""     # string | required | The cluster this node pool belongs to.
  annotations           = {}     # map(string) | optional | Annotations on the node Pool. This field has the same restri…
  display_name          = ""     # string | optional | The display name for the node pool.
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | The time the cluster was created, in RFC3339 text format.
  # delete_time           = ""     # string | computed | The time the cluster was deleted, in RFC3339 text format.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # etag                  = ""     # string | computed | This checksum is computed by the server based on the value o…
  # on_prem_version       = ""     # string | computed | Anthos version for the node pool. Defaults to the user clust…
  # reconciling           = false  # bool | computed | If set, there are currently changes in flight to the node po…
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
  # uid                   = ""     # string | computed | The unique identifier of the node pool.
  # update_time           = ""     # string | computed | The time the cluster was last updated, in RFC3339 text forma…

  config { # list [1..1]
    image_type           = ""     # string | required | The OS image to be used for each node in a node pool. Curren…
    boot_disk_size_gb    = 0      # number | optional | VMware disk size to be used during creation.
    cpus                 = 0      # number | optional | The number of CPUs for each node in the node pool.
    enable_load_balancer = false  # bool | optional | Allow node pool traffic to be load balanced. Only works for …
    image                = ""     # string | optional | The OS image name in vCenter, only valid when using Windows.
    labels               = {}     # map(string) | optional+computed | The map of Kubernetes labels (key/value pairs) to be applied…
    memory_mb            = 0      # number | optional | The megabytes of memory for each node in the node pool.
    replicas             = 0      # number | optional | The number of nodes in the node pool.

    taints { # list
      key    = ""     # string | required | Key associated with the effect.
      value  = ""     # string | required | Value associated with the effect.
      effect = ""     # string | optional | Available taint effects. Possible values: ["EFFECT_UNSPECIFI…

    }

    vsphere_config { # list [0..1]
      datastore   = ""     # string | optional | The name of the vCenter datastore. Inherited from the user c…
      host_groups = []     # list(string) | optional | Vsphere host groups to apply to all VMs in the node pool

      tags { # list
        category = ""     # string | optional | The Vsphere tag category.
        tag      = ""     # string | optional | The Vsphere tag name.

      }

    }

  }

  node_pool_autoscaling { # list [0..1]
    max_replicas = 0      # number | required | Maximum number of replicas in the NodePool.
    min_replicas = 0      # number | required | Minimum number of replicas in the NodePool.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

