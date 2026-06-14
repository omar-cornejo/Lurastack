# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_identity_groups                            │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_identity_groups" "this" {

  parent = ""     # string | required | The resource name of the entity under which this Group resid…
  id     = ""     # string | optional+computed

  # groups = [  # list(object)
  #   {
  #     additional_group_keys = [  # list(object)
  #       {
  #         id = ""
  #         namespace = ""
  #       }
  #     ]
  #     create_time = ""
  #     description = ""
  #     display_name = ""
  #     group_key = [  # list(object)
  #       {
  #         id = ""
  #         namespace = ""
  #       }
  #     ]
  #     initial_group_config = ""
  #     labels = {}  # map(string)
  #     name = ""
  #     parent = ""
  #     update_time = ""
  #   }
  # ]

}

