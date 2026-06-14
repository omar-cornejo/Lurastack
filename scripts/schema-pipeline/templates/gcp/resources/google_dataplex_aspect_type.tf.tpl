# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_aspect_type                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_aspect_type" "this" {

  aspect_type_id    = ""     # string | optional | The aspect type id of the aspect type.
  description       = ""     # string | optional | Description of the AspectType.
  display_name      = ""     # string | optional | User friendly display name.
  id                = ""     # string | optional+computed
  labels            = {}     # map(string) | optional | User-defined labels for the AspectType.   **Note**: This fie…
  location          = ""     # string | optional | The location where aspect type will be created in.
  metadata_template = ""     # string | optional | MetadataTemplate of the Aspect.
  project           = ""     # string | optional+computed

  # create_time       = ""     # string | computed | The time when the AspectType was created.
  # effective_labels  = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name              = ""     # string | computed | The relative resource name of the AspectType, of the form: p…
  # terraform_labels  = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # transfer_status   = ""     # string | computed | Denotes the transfer status of the Aspect Type. It is unspec…
  # uid               = ""     # string | computed | System generated globally unique ID for the AspectType. This…
  # update_time       = ""     # string | computed | The time when the AspectType was last updated.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

