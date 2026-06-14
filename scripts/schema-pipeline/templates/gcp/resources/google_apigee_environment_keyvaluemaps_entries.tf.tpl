# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_environment_keyvaluemaps_entries      │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_environment_keyvaluemaps_entries" "this" {

  env_keyvaluemap_id = ""     # string | required | The Apigee environment keyvalumaps Id associated with the Ap…
  name               = ""     # string | required | Required. Resource URI that can be used to identify the scop…
  value              = ""     # string | required | Required. Data or payload that is being retrieved and associ…
  id                 = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

