# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_container_registry_repository                    │
# └──────────────────────────────────────────────────────────────┘
data "google_container_registry_repository" "this" {

  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed
  region         = ""     # string | optional

  # repository_url = ""     # string | computed

}

