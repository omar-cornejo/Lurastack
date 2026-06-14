# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_monitoring_group                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_monitoring_group" "this" {

  display_name = ""     # string | required | A user-assigned name for this group, used only for display p…
  filter       = ""     # string | required | The filter used to determine which monitored resources belon…
  id           = ""     # string | optional+computed
  is_cluster   = false  # bool | optional | If true, the members of this group are considered to be a cl…
  parent_name  = ""     # string | optional | The name of the group's parent, if it has one. The format is…
  project      = ""     # string | optional+computed

  # name         = ""     # string | computed | A unique identifier for this group. The format is "projects/…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

