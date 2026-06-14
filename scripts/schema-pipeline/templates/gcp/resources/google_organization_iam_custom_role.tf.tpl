# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_organization_iam_custom_role                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_organization_iam_custom_role" "this" {

  org_id      = ""     # string | required | The numeric ID of the organization in which you want to crea…
  permissions = []     # set(string) | required | The names of the permissions this role grants when bound in …
  role_id     = ""     # string | required | The role id to use for this role.
  title       = ""     # string | required | A human-readable title for the role.
  description = ""     # string | optional | A human-readable description for the role.
  id          = ""     # string | optional+computed
  stage       = ""     # string | optional | The current launch stage of the role. Defaults to GA.

  # deleted     = false  # bool | computed | The current deleted state of the role.
  # name        = ""     # string | computed | The name of the role in the format organizations/{{org_id}}/…

}

