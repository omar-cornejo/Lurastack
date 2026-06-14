# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_cluster                             │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_cluster" "this" {

  name              = ""     # string | required | The ID of the Cluster.
  parent            = ""     # string | required | The resource name of the private cloud to create a new clust…
  id                = ""     # string | optional+computed

  # management        = false  # bool | computed | True if the cluster is a management cluster; false otherwise…
  # node_type_configs = [  # set(object)
  #   {
  #     custom_core_count = 0
  #     node_count = 0
  #     node_type_id = ""
  #   }
  # ]
  # state             = ""     # string | computed | State of the Cluster.
  # uid               = ""     # string | computed | System-generated unique identifier for the resource.

}

