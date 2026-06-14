# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_edgecontainer_node_pool                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_edgecontainer_node_pool" "this" {

  cluster          = ""     # string | required | The name of the target Distributed Cloud Edge Cluster.
  location         = ""     # string | required | The location of the resource.
  name             = ""     # string | required | The resource name of the node pool.
  node_count       = 0      # number | required | The number of nodes in the pool.
  node_location    = ""     # string | required | Name of the Google Distributed Cloud Edge zone where this no…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Labels associated with this resource.  **Note**: This field …
  machine_filter   = ""     # string | optional+computed | Only machines matching this filter will be allowed to join t…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | The time when the node pool was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # node_version     = ""     # string | computed | The lowest release version among all worker nodes.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The time when the node pool was last updated.

  local_disk_encryption { # list [0..1]
    kms_key                = ""     # string | optional | The Cloud KMS CryptoKey e.g. projects/{project}/locations/{l…

    # kms_key_active_version = ""     # string | computed | The Cloud KMS CryptoKeyVersion currently in use for protecti…
    # kms_key_state          = ""     # string | computed | Availability of the Cloud KMS CryptoKey. If not KEY_AVAILABL…

  }

  node_config { # list [0..1]
    labels = {}     # map(string) | optional+computed | "The Kubernetes node labels"

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

