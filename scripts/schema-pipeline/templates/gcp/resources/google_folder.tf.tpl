# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_folder                                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_folder" "this" {

  display_name    = ""     # string | required | The folder's display name. A folder's display name must be u…
  parent          = ""     # string | required | The resource name of the parent Folder or Organization. Must…
  id              = ""     # string | optional+computed

  # create_time     = ""     # string | computed | Timestamp when the Folder was created. Assigned by the serve…
  # folder_id       = ""     # string | computed | The folder id from the name "folders/{folder_id}"
  # lifecycle_state = ""     # string | computed | The lifecycle state of the folder such as ACTIVE or DELETE_R…
  # name            = ""     # string | computed | The resource name of the Folder. Its format is folders/{fold…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

