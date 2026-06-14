# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebaserules_release                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebaserules_release" "this" {

  name         = ""     # string | required | Format: `projects/{project_id}/releases/{release_id}`\Firest…
  ruleset_name = ""     # string | required | Name of the `Ruleset` referred to by this `Release`. The `Ru…
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed | The project for the resource

  # create_time  = ""     # string | computed | Output only. Time the release was created.
  # disabled     = false  # bool | computed | Disable the release to keep it from being served. The respon…
  # update_time  = ""     # string | computed | Output only. Time the release was updated.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

