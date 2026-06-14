# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_managed_folder                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_managed_folder" "this" {

  bucket         = ""     # string | required | The name of the bucket that contains the managed folder.
  name           = ""     # string | required | The name of the managed folder expressed as a path. Must inc…
  force_destroy  = false  # bool | optional | Allows the deletion of a managed folder even if contains obj…
  id             = ""     # string | optional+computed

  # create_time    = ""     # string | computed | The timestamp at which this managed folder was created.
  # metageneration = ""     # string | computed | The metadata generation of the managed folder.
  # self_link      = ""     # string | computed
  # update_time    = ""     # string | computed | The timestamp at which this managed folder was most recently…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

