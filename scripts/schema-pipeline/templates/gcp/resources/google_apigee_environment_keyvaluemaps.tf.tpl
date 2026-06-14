# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_environment_keyvaluemaps              │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_environment_keyvaluemaps" "this" {

  env_id = ""     # string | required | The Apigee environment group associated with the Apigee envi…
  name   = ""     # string | required | Required. ID of the key value map.
  id     = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

