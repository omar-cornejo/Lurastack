# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_monitoring_service                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_monitoring_service" "this" {

  service_id   = ""     # string | required | An optional service ID to use. If not given, the server will…
  display_name = ""     # string | optional | Name used for UI elements listing this Service.
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed
  user_labels  = {}     # map(string) | optional | Labels which have been used to annotate the service. Label k…

  # name         = ""     # string | computed | The full resource name for this service. The syntax is: proj…
  # telemetry = [  # list(object)
  #   {
  #     resource_name = ""
  #   }
  # ]

  basic_service { # list [0..1]
    service_labels = {}     # map(string) | optional | Labels that specify the resource that emits the monitoring d…
    service_type   = ""     # string | optional | The type of service that this basic service defines, e.g. AP…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

