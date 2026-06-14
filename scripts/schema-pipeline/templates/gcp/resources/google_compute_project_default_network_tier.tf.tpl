# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_project_default_network_tier         │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_project_default_network_tier" "this" {

  network_tier = ""     # string | required | The default network tier to be configured for the project. T…
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…

  timeouts { # single
    create = ""     # string | optional

  }

}

