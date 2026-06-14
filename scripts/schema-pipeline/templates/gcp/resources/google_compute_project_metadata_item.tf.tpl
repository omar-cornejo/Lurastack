# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_project_metadata_item                │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_project_metadata_item" "this" {

  key     = ""     # string | required | The metadata key to set.
  value   = ""     # string | required | The value to set for the given metadata key.
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

