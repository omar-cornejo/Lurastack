# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_access_policy         │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_access_policy" "this" {

  parent      = ""     # string | required | The parent of this AccessPolicy in the Cloud Resource Hierar…
  title       = ""     # string | required | Human readable title. Does not affect behavior.
  id          = ""     # string | optional+computed
  scopes      = []     # list(string) | optional | Folder or project on which this policy is applicable. Format…

  # create_time = ""     # string | computed | Time the AccessPolicy was created in UTC.
  # name        = ""     # string | computed | Resource name of the AccessPolicy. Format: '{{policy_id}}'
  # update_time = ""     # string | computed | Time the AccessPolicy was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

