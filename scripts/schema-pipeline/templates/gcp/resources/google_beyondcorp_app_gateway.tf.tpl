# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_beyondcorp_app_gateway                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_beyondcorp_app_gateway" "this" {

  name                  = ""     # string | required | ID of the AppGateway.
  display_name          = ""     # string | optional | An arbitrary user-provided name for the AppGateway.
  host_type             = ""     # string | optional | The type of hosting used by the AppGateway. Default value: "…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Resource labels to represent user provided metadata.   **Not…
  project               = ""     # string | optional+computed
  region                = ""     # string | optional | The region of the AppGateway.
  type                  = ""     # string | optional | The type of network connectivity used by the AppGateway. Def…

  # allocated_connections = [  # list(object)
  #   {
  #     ingress_port = 0
  #     psc_uri = ""
  #   }
  # ]
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # state                 = ""     # string | computed | Represents the different states of a AppGateway.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uri                   = ""     # string | computed | Server-defined URI for this resource.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

