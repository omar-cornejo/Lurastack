# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_project_service                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_project_service" "this" {

  service                    = ""     # string | required
  id                         = ""     # string | optional+computed
  project                    = ""     # string | optional

  # disable_dependent_services = false  # bool | computed
  # disable_on_destroy         = false  # bool | computed

}

