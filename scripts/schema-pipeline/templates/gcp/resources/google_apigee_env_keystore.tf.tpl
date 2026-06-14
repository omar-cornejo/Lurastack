# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_env_keystore                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_env_keystore" "this" {

  env_id  = ""     # string | required | The Apigee environment group associated with the Apigee envi…
  id      = ""     # string | optional+computed
  name    = ""     # string | optional | The name of the newly created keystore.

  # aliases = []     # list(string) | computed | Aliases in this keystore.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

