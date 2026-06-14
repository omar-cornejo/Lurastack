# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_scc_v2_organization_source                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_scc_v2_organization_source" "this" {

  display_name = ""     # string | required | The source’s display name. A source’s display name must be u…
  organization = ""     # string | required | The organization whose Cloud Security Command Center the Sou…
  description  = ""     # string | optional | The description of the source (max of 1024 characters).
  id           = ""     # string | optional+computed

  # name         = ""     # string | computed | The resource name of this source, in the format 'organizatio…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

