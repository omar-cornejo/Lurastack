# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_env_references                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_env_references" "this" {

  env_id        = ""     # string | required | The Apigee environment group associated with the Apigee envi…
  name          = ""     # string | required | Required. The resource id of this reference. Values must mat…
  refers        = ""     # string | required | Required. The id of the resource to which this reference ref…
  resource_type = ""     # string | required | The type of resource referred to by this reference. Valid va…
  description   = ""     # string | optional | Optional. A human-readable description of this reference.
  id            = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

