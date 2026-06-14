# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_instance_attachment                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_instance_attachment" "this" {

  environment = ""     # string | required | The resource ID of the environment.
  instance_id = ""     # string | required | The Apigee instance associated with the Apigee environment, …
  id          = ""     # string | optional+computed

  # name        = ""     # string | computed | The name of the newly created  attachment (output parameter)…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

