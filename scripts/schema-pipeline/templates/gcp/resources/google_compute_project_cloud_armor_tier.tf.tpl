# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_project_cloud_armor_tier             │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_project_cloud_armor_tier" "this" {

  cloud_armor_tier = ""     # string | required | Managed protection tier to be set. Possible values: ["CA_STA…
  id               = ""     # string | optional+computed
  project          = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

