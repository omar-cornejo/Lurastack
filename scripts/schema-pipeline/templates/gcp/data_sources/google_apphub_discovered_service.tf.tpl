# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_apphub_discovered_service                        │
# └──────────────────────────────────────────────────────────────┘
data "google_apphub_discovered_service" "this" {

  location           = ""     # string | required
  service_uri        = ""     # string | required
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional

  # name               = ""     # string | computed
  # service_properties = [  # list(object)
  #   {
  #     gcp_project = ""
  #     location = ""
  #     zone = ""
  #   }
  # ]
  # service_reference = [  # list(object)
  #   {
  #     path = ""
  #     uri = ""
  #   }
  # ]

}

