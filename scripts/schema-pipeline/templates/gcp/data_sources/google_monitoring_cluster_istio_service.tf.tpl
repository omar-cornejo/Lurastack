# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_monitoring_cluster_istio_service                 │
# └──────────────────────────────────────────────────────────────┘
data "google_monitoring_cluster_istio_service" "this" {

  cluster_name      = ""     # string | required | The name of the Kubernetes cluster in which this Istio servi…
  location          = ""     # string | required | The location of the Kubernetes cluster in which this Istio s…
  service_name      = ""     # string | required | The name of the Istio service underlying this service.      …
  service_namespace = ""     # string | required | The namespace of the Istio service underlying this service. …
  id                = ""     # string | optional+computed
  project           = ""     # string | optional

  # display_name      = ""     # string | computed | Name used for UI elements listing this Service.
  # name              = ""     # string | computed | The full resource name for this service. The syntax is: proj…
  # service_id        = ""     # string | computed | An optional service ID to use. If not given, the server will…
  # telemetry = [  # list(object)
  #   {
  #     resource_name = ""
  #   }
  # ]
  # user_labels       = {}     # map(string) | computed | Labels which have been used to annotate the service. Label k…

}

