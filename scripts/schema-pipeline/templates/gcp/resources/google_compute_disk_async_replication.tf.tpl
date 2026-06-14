# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_disk_async_replication               │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_disk_async_replication" "this" {

  primary_disk = ""     # string | required | Primary disk for asynchronous replication.
  id           = ""     # string | optional+computed

  secondary_disk { # list [1..1]
    disk  = ""     # string | required | Secondary disk for asynchronous replication.

    # state = ""     # string | computed | Output-only. Status of replication on the secondary disk.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

