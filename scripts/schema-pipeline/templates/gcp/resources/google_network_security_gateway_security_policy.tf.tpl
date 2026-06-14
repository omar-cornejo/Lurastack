# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_gateway_security_policy     │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_gateway_security_policy" "this" {

  name        = ""     # string | required | Name of the resource. Name is of the form projects/{project}…
  description = ""     # string | optional | A free-text description of the resource. Max length 1024 cha…
  id          = ""     # string | optional+computed
  location    = ""     # string | optional | The location of the gateway security policy. The default val…
  project     = ""     # string | optional+computed

  # create_time = ""     # string | computed | The timestamp when the resource was created. A timestamp in …
  # self_link   = ""     # string | computed | Server-defined URL of this resource.
  # update_time = ""     # string | computed | The timestamp when the resource was updated. A timestamp in …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

