# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_filestore_snapshot                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_filestore_snapshot" "this" {

  instance              = ""     # string | required | The resource name of the filestore instance.
  location              = ""     # string | required | The name of the location of the instance. This can be a regi…
  name                  = ""     # string | required | The resource name of the snapshot. The name must be unique w…
  description           = ""     # string | optional | A description of the snapshot with 2048 characters or less. …
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Resource labels to represent user-provided metadata.   **Not…
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | The time when the snapshot was created in RFC3339 text forma…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # filesystem_used_bytes = ""     # string | computed | The amount of bytes needed to allocate a full copy of the sn…
  # state                 = ""     # string | computed | The snapshot state.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

