# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_beyondcorp_app_gateway                           │
# └──────────────────────────────────────────────────────────────┘
data "google_beyondcorp_app_gateway" "this" {

  name                  = ""     # string | required | ID of the AppGateway.
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional
  region                = ""     # string | optional | The region of the AppGateway.

  # allocated_connections = [  # list(object)
  #   {
  #     ingress_port = 0
  #     psc_uri = ""
  #   }
  # ]
  # display_name          = ""     # string | computed | An arbitrary user-provided name for the AppGateway.
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # host_type             = ""     # string | computed | The type of hosting used by the AppGateway. Default value: "…
  # labels                = {}     # map(string) | computed | Resource labels to represent user provided metadata.   **Not…
  # state                 = ""     # string | computed | Represents the different states of a AppGateway.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # type                  = ""     # string | computed | The type of network connectivity used by the AppGateway. Def…
  # uri                   = ""     # string | computed | Server-defined URI for this resource.

}

