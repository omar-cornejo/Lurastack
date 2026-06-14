# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_external_vpn_gateway                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_external_vpn_gateway" "this" {

  name              = ""     # string | required | Name of the resource. Provided by the client when the resour…
  description       = ""     # string | optional | An optional description of this resource.
  id                = ""     # string | optional+computed
  labels            = {}     # map(string) | optional | Labels for the external VPN gateway resource.  **Note**: Thi…
  project           = ""     # string | optional+computed
  redundancy_type   = ""     # string | optional | Indicates the redundancy type of this external VPN gateway P…

  # effective_labels  = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # label_fingerprint = ""     # string | computed | The fingerprint used for optimistic locking of this resource…
  # self_link         = ""     # string | computed
  # terraform_labels  = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  interface { # list
    id         = 0      # number | optional | The numeric ID for this interface. Allowed values are based …
    ip_address = ""     # string | optional | IP address of the interface in the external VPN gateway. Onl…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

