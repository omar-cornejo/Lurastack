# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_project_usage_export_bucket                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_project_usage_export_bucket" "this" {

  bucket_name = ""     # string | required | The bucket to store reports in.
  id          = ""     # string | optional+computed
  prefix      = ""     # string | optional | A prefix for the reports, for instance, the project name.
  project     = ""     # string | optional+computed | The project to set the export bucket on. If it is not provid…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

