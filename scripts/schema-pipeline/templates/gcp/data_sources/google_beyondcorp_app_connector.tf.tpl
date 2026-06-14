# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_beyondcorp_app_connector                         │
# └──────────────────────────────────────────────────────────────┘
data "google_beyondcorp_app_connector" "this" {

  name             = ""     # string | required | ID of the AppConnector.
  id               = ""     # string | optional+computed
  project          = ""     # string | optional
  region           = ""     # string | optional | The region of the AppConnector.

  # display_name     = ""     # string | computed | An arbitrary user-provided name for the AppConnector.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # labels           = {}     # map(string) | computed | Resource labels to represent user provided metadata.   **Not…
  # principal_info = [  # list(object)
  #   {
  #     service_account = [  # list(object)
  #       {
  #         email = ""
  #       }
  #     ]
  #   }
  # ]
  # state            = ""     # string | computed | Represents the different states of a AppConnector.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

}

