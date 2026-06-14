# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_entry_type                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_entry_type" "this" {

  description      = ""     # string | optional | Description of the EntryType.
  display_name     = ""     # string | optional | User friendly display name.
  entry_type_id    = ""     # string | optional | The entry type id of the entry type.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | User-defined labels for the EntryType.   **Note**: This fiel…
  location         = ""     # string | optional | The location where entry type will be created in.
  platform         = ""     # string | optional | The platform that Entries of this type belongs to.
  project          = ""     # string | optional+computed
  system           = ""     # string | optional | The system that Entries of this type belongs to.
  type_aliases     = []     # list(string) | optional | Indicates the class this Entry Type belongs to, for example,…

  # create_time      = ""     # string | computed | The time when the EntryType was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name             = ""     # string | computed | The relative resource name of the EntryType, of the form: pr…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid              = ""     # string | computed | System generated globally unique ID for the EntryType. This …
  # update_time      = ""     # string | computed | The time when the EntryType was last updated.

  required_aspects { # list
    type = ""     # string | optional | Required aspect type for the entry type.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

