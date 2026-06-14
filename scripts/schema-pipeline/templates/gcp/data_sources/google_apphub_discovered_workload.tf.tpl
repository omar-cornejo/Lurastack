# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_apphub_discovered_workload                       │
# └──────────────────────────────────────────────────────────────┘
data "google_apphub_discovered_workload" "this" {

  location            = ""     # string | required
  workload_uri        = ""     # string | required
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional

  # name                = ""     # string | computed
  # workload_properties = [  # list(object)
  #   {
  #     gcp_project = ""
  #     location = ""
  #     zone = ""
  #   }
  # ]
  # workload_reference = [  # list(object)
  #   {
  #     uri = ""
  #   }
  # ]

}

