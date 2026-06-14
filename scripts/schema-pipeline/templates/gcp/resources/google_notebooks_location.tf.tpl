# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_notebooks_location                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_notebooks_location" "this" {

  id        = ""     # string | optional+computed
  name      = ""     # string | optional | Name of the Location resource.
  project   = ""     # string | optional+computed

  # self_link = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

