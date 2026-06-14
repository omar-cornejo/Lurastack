# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_monitoring_custom_service                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_monitoring_custom_service" "this" {

  display_name = ""     # string | optional | Name used for UI elements listing this Service.
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed
  service_id   = ""     # string | optional+computed | An optional service ID to use. If not given, the server will…
  user_labels  = {}     # map(string) | optional | Labels which have been used to annotate the service. Label k…

  # name         = ""     # string | computed | The full resource name for this service. The syntax is: proj…

  telemetry { # list [0..1]
    resource_name = ""     # string | optional | The full name of the resource that defines this service. For…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

