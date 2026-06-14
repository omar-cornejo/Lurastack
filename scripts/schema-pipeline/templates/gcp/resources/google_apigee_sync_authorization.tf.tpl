# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_sync_authorization                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_sync_authorization" "this" {

  identities = []     # list(string) | required | Array of service accounts to grant access to control plane r…
  name       = ""     # string | required | Name of the Apigee organization.
  id         = ""     # string | optional+computed

  # etag       = ""     # string | computed | Entity tag (ETag) used for optimistic concurrency control as…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

