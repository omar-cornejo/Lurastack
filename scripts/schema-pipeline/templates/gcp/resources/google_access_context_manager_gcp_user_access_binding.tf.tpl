# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_gcp_user_access_binding  │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_gcp_user_access_binding" "this" {

  access_levels   = []     # list(string) | required | Required. Access level that a user must have to be granted a…
  group_key       = ""     # string | required | Required. Immutable. Google Group id whose members are subje…
  organization_id = ""     # string | required | Required. ID of the parent organization.
  id              = ""     # string | optional+computed

  # name            = ""     # string | computed | Immutable. Assigned by the server during creation. The last …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

