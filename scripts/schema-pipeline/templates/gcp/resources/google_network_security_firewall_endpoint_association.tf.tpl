# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_firewall_endpoint_association  │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_firewall_endpoint_association" "this" {

  firewall_endpoint     = ""     # string | required | The URL of the firewall endpoint that is being associated.
  location              = ""     # string | required | The location (zone) of the firewall endpoint association.
  name                  = ""     # string | required | The name of the firewall endpoint association resource.
  network               = ""     # string | required | The URL of the network that is being associated.
  disabled              = false  # bool | optional | Whether the association is disabled. True indicates that tra…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | A map of key/value label pairs to assign to the resource.   …
  parent                = ""     # string | optional | The name of the parent this firewall endpoint association be…
  tls_inspection_policy = ""     # string | optional | The URL of the TlsInspectionPolicy that is being associated.

  # create_time           = ""     # string | computed | Time the firewall endpoint was created in UTC.
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # reconciling           = false  # bool | computed | Whether reconciling is in progress, recommended per https://…
  # self_link             = ""     # string | computed | Server-defined URL of this resource.
  # state                 = ""     # string | computed | The current state of the endpoint.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time           = ""     # string | computed | Time the firewall endpoint was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

