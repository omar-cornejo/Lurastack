# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_netapp_volume_snapshot                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_netapp_volume_snapshot" "this" {

  location         = ""     # string | required | Name of the snapshot location. Snapshots are child resources…
  name             = ""     # string | required | The name of the snapshot.
  volume_name      = ""     # string | required | The name of the volume to create the snapshot in.
  description      = ""     # string | optional | Description for the snapshot.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Labels as key value pairs. Example: '{ "owner": "Bob", "depa…
  project          = ""     # string | optional+computed

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # used_bytes       = 0      # number | computed | Storage used to store blocks unique to this snapshot.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

