# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_container_registry_image                         │
# └──────────────────────────────────────────────────────────────┘
data "google_container_registry_image" "this" {

  name      = ""     # string | required
  digest    = ""     # string | optional
  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed
  region    = ""     # string | optional
  tag       = ""     # string | optional

  # image_url = ""     # string | computed

}

