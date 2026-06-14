# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_beyondcorp_app_connection                        │
# └──────────────────────────────────────────────────────────────┘
data "google_beyondcorp_app_connection" "this" {

  name                 = ""     # string | required | ID of the AppConnection.
  id                   = ""     # string | optional+computed
  project              = ""     # string | optional
  region               = ""     # string | optional | The region of the AppConnection.

  # application_endpoint = [  # list(object)
  #   {
  #     host = ""
  #     port = 0
  #   }
  # ]
  # connectors           = []     # list(string) | computed | List of AppConnectors that are authorised to be associated w…
  # display_name         = ""     # string | computed | An arbitrary user-provided name for the AppConnection.
  # effective_labels     = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # gateway = [  # list(object)
  #   {
  #     app_gateway = ""
  #     ingress_port = 0
  #     type = ""
  #     uri = ""
  #   }
  # ]
  # labels               = {}     # map(string) | computed | Resource labels to represent user provided metadata.   **Not…
  # terraform_labels     = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # type                 = ""     # string | computed | The type of network connectivity used by the AppConnection. …

}

