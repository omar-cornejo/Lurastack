# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_migration_center_group                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_migration_center_group" "this" {

  group_id         = ""     # string | required | Required. User specified ID for the group. It will become th…
  location         = ""     # string | required | The location of the group.
  description      = ""     # string | optional | Optional. The description of the group.
  display_name     = ""     # string | optional | Optional. User-friendly display name.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Labels as key value pairs.  **Note**: This field is non-auth…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Output only. The timestamp when the group was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name             = ""     # string | computed | Output only. The name of the group.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | Output only. The timestamp when the group was last updated.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

