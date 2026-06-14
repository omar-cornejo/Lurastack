# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_beyondcorp_app_connector                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_beyondcorp_app_connector" "this" {

  name             = ""     # string | required | ID of the AppConnector.
  display_name     = ""     # string | optional | An arbitrary user-provided name for the AppConnector.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Resource labels to represent user provided metadata.   **Not…
  project          = ""     # string | optional+computed
  region           = ""     # string | optional | The region of the AppConnector.

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # state            = ""     # string | computed | Represents the different states of a AppConnector.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  principal_info { # list [1..1]

    service_account { # list [1..1]
      email = ""     # string | required | Email address of the service account.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

