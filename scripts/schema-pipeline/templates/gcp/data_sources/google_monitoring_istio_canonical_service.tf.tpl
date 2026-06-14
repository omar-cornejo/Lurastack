# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_monitoring_istio_canonical_service               │
# └──────────────────────────────────────────────────────────────┘
data "google_monitoring_istio_canonical_service" "this" {

  canonical_service           = ""     # string | required | The name of the canonical service underlying this service.. …
  canonical_service_namespace = ""     # string | required | The namespace of the canonical service underlying this servi…
  mesh_uid                    = ""     # string | required | Identifier for the Istio mesh in which this canonical servic…
  id                          = ""     # string | optional+computed
  project                     = ""     # string | optional

  # display_name                = ""     # string | computed | Name used for UI elements listing this Service.
  # name                        = ""     # string | computed | The full resource name for this service. The syntax is: proj…
  # service_id                  = ""     # string | computed | An optional service ID to use. If not given, the server will…
  # telemetry = [  # list(object)
  #   {
  #     resource_name = ""
  #   }
  # ]
  # user_labels                 = {}     # map(string) | computed | Labels which have been used to annotate the service. Label k…

}

