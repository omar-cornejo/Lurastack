# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vmwareengine_external_access_rule            │
# └──────────────────────────────────────────────────────────────┘
resource "google_vmwareengine_external_access_rule" "this" {

  action            = ""     # string | required | The action that the external access rule performs. Possible …
  destination_ports = []     # list(string) | required | A list of destination ports to which the external access rul…
  ip_protocol       = ""     # string | required | The IP protocol to which the external access rule applies.
  name              = ""     # string | required | The ID of the external access rule.
  parent            = ""     # string | required | The resource name of the network policy. Resource names are …
  priority          = 0      # number | required | External access rule priority, which determines the external…
  source_ports      = []     # list(string) | required | A list of source ports to which the external access rule app…
  description       = ""     # string | optional | User-provided description for the external access rule.
  id                = ""     # string | optional+computed

  # create_time       = ""     # string | computed | Creation time of this resource. A timestamp in RFC3339 UTC "…
  # state             = ""     # string | computed | State of the Cluster.
  # uid               = ""     # string | computed | System-generated unique identifier for the resource.
  # update_time       = ""     # string | computed | Last updated time of this resource. A timestamp in RFC3339 U…

  destination_ip_ranges { # list [1..*]
    external_address = ""     # string | optional | The name of an 'ExternalAddress' resource.
    ip_address_range = ""     # string | optional | An IP address range in the CIDR format.

  }

  source_ip_ranges { # list [1..*]
    ip_address       = ""     # string | optional | A single IP address.
    ip_address_range = ""     # string | optional | An IP address range in the CIDR format.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

