# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_project_service                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_project_service" "this" {

  service                    = ""     # string | required
  disable_dependent_services = false  # bool | optional
  disable_on_destroy         = false  # bool | optional
  id                         = ""     # string | optional+computed
  project                    = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

