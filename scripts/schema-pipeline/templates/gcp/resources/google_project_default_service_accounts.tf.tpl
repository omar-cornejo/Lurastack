# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_project_default_service_accounts             │
# └──────────────────────────────────────────────────────────────┘
resource "google_project_default_service_accounts" "this" {

  action           = ""     # string | required | The action to be performed in the default service accounts. …
  project          = ""     # string | required | The project ID where service accounts are created.
  id               = ""     # string | optional+computed
  restore_policy   = ""     # string | optional | The action to be performed in the default service accounts o…

  # service_accounts = {}     # map(string) | computed | The Service Accounts changed by this resource. It is used fo…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}

