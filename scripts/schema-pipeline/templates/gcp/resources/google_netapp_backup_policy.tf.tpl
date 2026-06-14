# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_netapp_backup_policy                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_netapp_backup_policy" "this" {

  daily_backup_limit    = 0      # number | required | Number of daily backups to keep. Note that the minimum daily…
  location              = ""     # string | required | Name of the region for the policy to apply to.
  monthly_backup_limit  = 0      # number | required | Number of monthly backups to keep. Note that the sum of dail…
  name                  = ""     # string | required | The name of the backup policy. Needs to be unique per locati…
  weekly_backup_limit   = 0      # number | required | Number of weekly backups to keep. Note that the sum of daily…
  description           = ""     # string | optional | An optional description of this resource.
  enabled               = false  # bool | optional | If enabled, make backups automatically according to the sche…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Labels as key value pairs. Example: '{ "owner": "Bob", "depa…
  project               = ""     # string | optional+computed

  # assigned_volume_count = 0      # number | computed | The total number of volumes assigned by this backup policy.
  # create_time           = ""     # string | computed | Create time of the backup policy. A timestamp in RFC3339 UTC…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # state                 = ""     # string | computed | The state of the backup policy.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

