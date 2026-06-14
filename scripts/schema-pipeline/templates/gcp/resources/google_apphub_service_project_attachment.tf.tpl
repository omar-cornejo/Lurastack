# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apphub_service_project_attachment            │
# └──────────────────────────────────────────────────────────────┘
resource "google_apphub_service_project_attachment" "this" {

  service_project_attachment_id = ""     # string | required | Required. The service project attachment identifier must con…
  id                            = ""     # string | optional+computed
  project                       = ""     # string | optional+computed
  service_project               = ""     # string | optional | "Immutable. Service project name in the format: \"projects/a…

  # create_time                   = ""     # string | computed | Output only. Create time.
  # name                          = ""     # string | computed | "Identifier. The resource name of a ServiceProjectAttachment…
  # state                         = ""     # string | computed | ServiceProjectAttachment state.
  # uid                           = ""     # string | computed | Output only. A globally unique identifier (in UUID4 format) …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

