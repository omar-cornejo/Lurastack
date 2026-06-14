# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_authorized_orgs_desc  │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_authorized_orgs_desc" "this" {

  name                    = ""     # string | required | Resource name for the 'AuthorizedOrgsDesc'. Format: 'accessP…
  parent                  = ""     # string | required | Required. Resource name for the access policy which owns thi…
  asset_type              = ""     # string | optional | The type of entities that need to use the authorization rela…
  authorization_direction = ""     # string | optional | The direction of the authorization relationship between this…
  authorization_type      = ""     # string | optional | A granular control type for authorization levels. Valid valu…
  id                      = ""     # string | optional+computed
  orgs                    = []     # list(string) | optional | The list of organization ids in this AuthorizedOrgsDesc. For…

  # create_time             = ""     # string | computed | Time the AuthorizedOrgsDesc was created in UTC.
  # update_time             = ""     # string | computed | Time the AuthorizedOrgsDesc was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

