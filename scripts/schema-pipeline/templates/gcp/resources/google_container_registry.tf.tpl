# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_registry                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_registry" "this" {

  id               = ""     # string | optional+computed
  location         = ""     # string | optional | The location of the registry. One of ASIA, EU, US or not spe…
  project          = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…

  # bucket_self_link = ""     # string | computed | The URI of the created resource.

}

