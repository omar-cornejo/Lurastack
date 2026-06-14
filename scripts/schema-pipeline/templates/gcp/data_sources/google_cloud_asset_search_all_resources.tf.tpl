# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_asset_search_all_resources                 │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_asset_search_all_resources" "this" {

  scope       = ""     # string | required
  asset_types = []     # list(string) | optional
  id          = ""     # string | optional+computed
  query       = ""     # string | optional

  # results = [  # list(object)
  #   {
  #     asset_type = ""
  #     create_time = ""
  #     description = ""
  #     display_name = ""
  #     folders = []  # list(string)
  #     kms_keys = []  # list(string)
  #     labels = {}  # map(string)
  #     location = ""
  #     name = ""
  #     network_tags = []  # list(string)
  #     organization = ""
  #     parent_asset_type = ""
  #     parent_full_resource_name = ""
  #     project = ""
  #     state = ""
  #     update_time = ""
  #   }
  # ]

}

