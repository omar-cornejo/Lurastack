# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_billing_project_info                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_billing_project_info" "this" {

  billing_account = ""     # string | required | The ID of the billing account associated with the project, i…
  id              = ""     # string | optional+computed
  project         = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

