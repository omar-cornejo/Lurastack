# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_app_engine_service_network_settings          │
# └──────────────────────────────────────────────────────────────┘
resource "google_app_engine_service_network_settings" "this" {

  service = ""     # string | required | The name of the service these settings apply to.
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed

  network_settings { # list [1..1]
    ingress_traffic_allowed = ""     # string | optional | The ingress settings for version or service. Default value: …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

