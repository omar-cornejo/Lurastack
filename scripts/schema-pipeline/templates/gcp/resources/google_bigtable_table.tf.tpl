# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigtable_table                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigtable_table" "this" {

  instance_name           = ""     # string | required | The name of the Bigtable instance.
  name                    = ""     # string | required | The name of the table. Must be 1-50 characters and must only…
  change_stream_retention = ""     # string | optional+computed | Duration to retain change stream data for the table. Set to …
  deletion_protection     = ""     # string | optional+computed | A field to make the table protected against data loss i.e. w…
  id                      = ""     # string | optional+computed
  project                 = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  split_keys              = []     # list(string) | optional | A list of predefined keys to split the table on. !> Warning:…

  automated_backup_policy { # set [0..1]
    frequency        = ""     # string | optional+computed | How frequently automated backups should occur.
    retention_period = ""     # string | optional+computed | How long the automated backups should be retained.

  }

  column_family { # set
    family = ""     # string | required | The name of the column family.

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

