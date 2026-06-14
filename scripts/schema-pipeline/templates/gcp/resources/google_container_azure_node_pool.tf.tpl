# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_azure_node_pool                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_azure_node_pool" "this" {

  cluster                 = ""     # string | required | The azureCluster for the resource
  location                = ""     # string | required | The location for the resource
  name                    = ""     # string | required | The name of this resource.
  subnet_id               = ""     # string | required | The ARM ID of the subnet where the node pool VMs run. Make s…
  version                 = ""     # string | required | The Kubernetes version (e.g. `1.19.10-gke.1000`) running on …
  annotations             = {}     # map(string) | optional | Optional. Annotations on the node pool. This field has the s…
  azure_availability_zone = ""     # string | optional+computed | Optional. The Azure availability zone of the nodes in this n…
  id                      = ""     # string | optional+computed
  project                 = ""     # string | optional+computed | The project for the resource

  # create_time             = ""     # string | computed | Output only. The time at which this node pool was created.
  # effective_annotations   = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # etag                    = ""     # string | computed | Allows clients to perform consistent read-modify-writes thro…
  # reconciling             = false  # bool | computed | Output only. If set, there are currently pending changes to …
  # state                   = ""     # string | computed | Output only. The current state of the node pool. Possible va…
  # uid                     = ""     # string | computed | Output only. A globally unique identifier for the node pool.
  # update_time             = ""     # string | computed | Output only. The time at which this node pool was last updat…

  autoscaling { # list [1..1]
    max_node_count = 0      # number | required | Maximum number of nodes in the node pool. Must be >= min_nod…
    min_node_count = 0      # number | required | Minimum number of nodes in the node pool. Must be >= 1 and <…

  }

  config { # list [1..1]
    labels  = {}     # map(string) | optional | Optional. The initial labels assigned to nodes of this node …
    tags    = {}     # map(string) | optional | Optional. A set of tags to apply to all underlying Azure res…
    vm_size = ""     # string | optional+computed | Optional. The Azure VM size name. Example: `Standard_DS2_v2`…

    proxy_config { # list [0..1]
      resource_group_id = ""     # string | required | The ARM ID the of the resource group containing proxy keyvau…
      secret_id         = ""     # string | required | The URL the of the proxy setting secret with its version. Se…

    }

    root_volume { # list [0..1]
      size_gib = 0      # number | optional+computed | Optional. The size of the disk, in GiBs. When unspecified, a…

    }

    ssh_config { # list [1..1]
      authorized_key = ""     # string | required | The SSH public key data for VMs managed by Anthos. This acce…

    }

  }

  management { # list [0..1]
    auto_repair = false  # bool | optional+computed | Optional. Whether or not the nodes will be automatically rep…

  }

  max_pods_constraint { # list [1..1]
    max_pods_per_node = 0      # number | required | The maximum number of pods to schedule on a single node.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

