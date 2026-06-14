# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_envgroup_attachment                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_envgroup_attachment" "this" {

  envgroup_id = ""     # string | required | The Apigee environment group associated with the Apigee envi…
  environment = ""     # string | required | The resource ID of the environment.
  id          = ""     # string | optional+computed

  # name        = ""     # string | computed | The name of the newly created  attachment (output parameter)…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

