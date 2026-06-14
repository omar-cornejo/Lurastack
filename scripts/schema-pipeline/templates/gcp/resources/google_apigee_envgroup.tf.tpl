# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_envgroup                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_envgroup" "this" {

  name      = ""     # string | required | The resource ID of the environment group.
  org_id    = ""     # string | required | The Apigee Organization associated with the Apigee environme…
  hostnames = []     # list(string) | optional | Hostnames of the environment group.
  id        = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

