# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_container_attached_versions                      │
# └──────────────────────────────────────────────────────────────┘
data "google_container_attached_versions" "this" {

  location       = ""     # string | required
  project        = ""     # string | required
  id             = ""     # string | optional+computed

  # valid_versions = []     # list(string) | computed

}

