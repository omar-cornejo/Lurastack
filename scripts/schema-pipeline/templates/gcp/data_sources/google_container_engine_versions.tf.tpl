# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_container_engine_versions                        │
# └──────────────────────────────────────────────────────────────┘
data "google_container_engine_versions" "this" {

  id                              = ""     # string | optional+computed
  location                        = ""     # string | optional
  project                         = ""     # string | optional
  version_prefix                  = ""     # string | optional

  # default_cluster_version         = ""     # string | computed
  # latest_master_version           = ""     # string | computed
  # latest_node_version             = ""     # string | computed
  # release_channel_default_version = {}     # map(string) | computed
  # release_channel_latest_version  = {}     # map(string) | computed
  # valid_master_versions           = []     # list(string) | computed
  # valid_node_versions             = []     # list(string) | computed

}

