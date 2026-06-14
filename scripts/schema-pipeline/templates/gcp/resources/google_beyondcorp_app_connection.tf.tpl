# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_beyondcorp_app_connection                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_beyondcorp_app_connection" "this" {

  name             = ""     # string | required | ID of the AppConnection.
  connectors       = []     # list(string) | optional | List of AppConnectors that are authorised to be associated w…
  display_name     = ""     # string | optional | An arbitrary user-provided name for the AppConnection.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Resource labels to represent user provided metadata.   **Not…
  project          = ""     # string | optional+computed
  region           = ""     # string | optional | The region of the AppConnection.
  type             = ""     # string | optional | The type of network connectivity used by the AppConnection. …

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  application_endpoint { # list [1..1]
    host = ""     # string | required | Hostname or IP address of the remote application endpoint.
    port = 0      # number | required | Port of the remote application endpoint.

  }

  gateway { # list [0..1]
    app_gateway  = ""     # string | required | AppGateway name in following format: projects/{project_id}/l…
    type         = ""     # string | optional | The type of hosting used by the gateway. Refer to https://cl…

    # ingress_port = 0      # number | computed | Ingress port reserved on the gateways for this AppConnection…
    # uri          = ""     # string | computed | Server-defined URI for this resource.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

