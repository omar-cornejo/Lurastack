# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_artifact_registry_locations                      │
# └──────────────────────────────────────────────────────────────┘
data "google_artifact_registry_locations" "this" {

  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed

  # locations = []     # list(string) | computed

}

