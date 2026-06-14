# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_entry_group                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_entry_group" "this" {

  description      = ""     # string | optional | Description of the EntryGroup.
  display_name     = ""     # string | optional | User friendly display name.
  entry_group_id   = ""     # string | optional | The entry group id of the entry group.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | User-defined labels for the EntryGroup.   **Note**: This fie…
  location         = ""     # string | optional | The location where entry group will be created in.
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | The time when the EntryGroup was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name             = ""     # string | computed | The relative resource name of the EntryGroup, of the form: p…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # transfer_status  = ""     # string | computed | Denotes the transfer status of the Entry Group. It is unspec…
  # uid              = ""     # string | computed | System generated globally unique ID for the EntryGroup. This…
  # update_time      = ""     # string | computed | The time when the EntryGroup was last updated.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

