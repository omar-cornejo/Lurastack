# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_biglake_catalog                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_biglake_catalog" "this" {

  location    = ""     # string | required | The geographic location where the Catalog should reside.
  name        = ""     # string | required | The name of the Catalog. Format: projects/{project_id_or_num…
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # create_time = ""     # string | computed | Output only. The creation time of the catalog. A timestamp i…
  # delete_time = ""     # string | computed | Output only. The deletion time of the catalog. Only set afte…
  # expire_time = ""     # string | computed | Output only. The time when this catalog is considered expire…
  # update_time = ""     # string | computed | Output only. The last modification time of the catalog. A ti…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

