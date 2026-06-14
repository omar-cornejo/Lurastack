# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_monitoring_monitored_project                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_monitoring_monitored_project" "this" {

  metrics_scope = ""     # string | required | Required. The resource name of the existing Metrics Scope th…
  name          = ""     # string | required | Immutable. The resource name of the 'MonitoredProject'. On i…
  id            = ""     # string | optional+computed

  # create_time   = ""     # string | computed | Output only. The time when this 'MonitoredProject' was creat…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

