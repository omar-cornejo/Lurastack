# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_monitoring_dashboard                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_monitoring_dashboard" "this" {

  dashboard_json = ""     # string | required | The JSON representation of a dashboard, following the format…
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

