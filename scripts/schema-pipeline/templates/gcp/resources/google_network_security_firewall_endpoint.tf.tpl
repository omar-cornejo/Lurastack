# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_firewall_endpoint           │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_firewall_endpoint" "this" {

  billing_project_id  = ""     # string | required | Project to bill on endpoint uptime usage.
  location            = ""     # string | required | The location (zone) of the firewall endpoint.
  name                = ""     # string | required | The name of the firewall endpoint resource.
  parent              = ""     # string | required | The name of the parent this firewall endpoint belongs to. Fo…
  id                  = ""     # string | optional+computed
  labels              = {}     # map(string) | optional | A map of key/value label pairs to assign to the resource.   …

  # associated_networks = []     # list(string) | computed | List of networks that are associated with this endpoint in t…
  # create_time         = ""     # string | computed | Time the firewall endpoint was created in UTC.
  # effective_labels    = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # reconciling         = false  # bool | computed | Whether reconciling is in progress, recommended per https://…
  # self_link           = ""     # string | computed | Server-defined URL of this resource.
  # state               = ""     # string | computed | The current state of the endpoint.
  # terraform_labels    = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time         = ""     # string | computed | Time the firewall endpoint was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

