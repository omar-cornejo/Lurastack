# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_netapp_backup_vault                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_netapp_backup_vault" "this" {

  location         = ""     # string | required | Location (region) of the backup vault.
  name             = ""     # string | required | The resource name of the backup vault. Needs to be unique pe…
  description      = ""     # string | optional | An optional description of this resource.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Labels as key value pairs. Example: '{ "owner": "Bob", "depa…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Create time of the backup vault. A timestamp in RFC3339 UTC …
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # state            = ""     # string | computed | The state of the Backup Vault.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

