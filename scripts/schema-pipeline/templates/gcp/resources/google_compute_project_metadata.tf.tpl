# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_project_metadata                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_project_metadata" "this" {

  metadata = {}     # map(string) | required | A series of key value pairs.
  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

