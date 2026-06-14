# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_container_attached_install_manifest              │
# └──────────────────────────────────────────────────────────────┘
data "google_container_attached_install_manifest" "this" {

  cluster_id       = ""     # string | required
  location         = ""     # string | required
  platform_version = ""     # string | required
  project          = ""     # string | required
  id               = ""     # string | optional+computed

  # manifest         = ""     # string | computed

}

