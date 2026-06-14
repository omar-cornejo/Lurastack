# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_project_iam_custom_role                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_project_iam_custom_role" "this" {

  permissions = []     # set(string) | required | The names of the permissions this role grants when bound in …
  role_id     = ""     # string | required | The camel case role id to use for this role. Cannot contain …
  title       = ""     # string | required | A human-readable title for the role.
  description = ""     # string | optional | A human-readable description for the role.
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed | The project that the service account will be created in. Def…
  stage       = ""     # string | optional | The current launch stage of the role. Defaults to GA.

  # deleted     = false  # bool | computed | The current deleted state of the role.
  # name        = ""     # string | computed | The name of the role in the format projects/{{project}}/role…

}

