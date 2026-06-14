# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_monitoring_app_engine_service                    │
# └──────────────────────────────────────────────────────────────┘
data "google_monitoring_app_engine_service" "this" {

  module_id    = ""     # string | required | The ID of the App Engine module underlying this service.  Co…
  id           = ""     # string | optional+computed
  project      = ""     # string | optional

  # display_name = ""     # string | computed | Name used for UI elements listing this Service.
  # name         = ""     # string | computed | The full resource name for this service. The syntax is: proj…
  # service_id   = ""     # string | computed | An optional service ID to use. If not given, the server will…
  # telemetry = [  # list(object)
  #   {
  #     resource_name = ""
  #   }
  # ]
  # user_labels  = {}     # map(string) | computed | Labels which have been used to annotate the service. Label k…

}

