# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_tpu_node                                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_tpu_node" "this" {

  accelerator_type       = ""     # string | required | The type of hardware accelerators associated with this node.
  name                   = ""     # string | required | The immutable name of the TPU.
  tensorflow_version     = ""     # string | required | The version of Tensorflow running in the Node.
  cidr_block             = ""     # string | optional+computed | The CIDR block that the TPU node will use when selecting an …
  description            = ""     # string | optional | The user-supplied description of the TPU. Maximum of 512 cha…
  id                     = ""     # string | optional+computed
  labels                 = {}     # map(string) | optional | Resource labels to represent user provided metadata.  **Note…
  network                = ""     # string | optional+computed | The name of a network to peer the TPU node to. It must be a …
  project                = ""     # string | optional+computed
  use_service_networking = false  # bool | optional | Whether the VPC peering for the node is set up through Servi…
  zone                   = ""     # string | optional+computed | The GCP location for the TPU. If it is not provided, the pro…

  # effective_labels       = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # network_endpoints = [  # list(object)
  #   {
  #     ip_address = ""
  #     port = 0
  #   }
  # ]
  # service_account        = ""     # string | computed | The service account used to run the tensor flow services wit…
  # terraform_labels       = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  scheduling_config { # list [0..1]
    preemptible = false  # bool | required | Defines whether the TPU instance is preemptible.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

