# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloud_identity_group                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloud_identity_group" "this" {

  labels                = {}     # map(string) | required | One or more label entries that apply to the Group. Currently…
  parent                = ""     # string | required | The resource name of the entity under which this Group resid…
  description           = ""     # string | optional | An extended description to help users determine the purpose …
  display_name          = ""     # string | optional | The display name of the Group.
  id                    = ""     # string | optional+computed
  initial_group_config  = ""     # string | optional | The initial configuration options for creating a Group.  See…

  # additional_group_keys = [  # list(object)
  #   {
  #     id = ""
  #     namespace = ""
  #   }
  # ]
  # create_time           = ""     # string | computed | The time when the Group was created.
  # name                  = ""     # string | computed | Resource name of the Group in the format: groups/{group_id},…
  # update_time           = ""     # string | computed | The time when the Group was last updated.

  group_key { # list [1..1]
    id        = ""     # string | required | The ID of the entity.  For Google-managed entities, the id m…
    namespace = ""     # string | optional | The namespace in which the entity exists.  If not specified,…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

