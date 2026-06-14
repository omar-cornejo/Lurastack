# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vmwareengine_network_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_vmwareengine_network_policy" "this" {

  edge_services_cidr              = ""     # string | required | IP address range in CIDR notation used to create internet ac…
  location                        = ""     # string | required | The resource name of the location (region) to create the new…
  name                            = ""     # string | required | The ID of the Network Policy.
  vmware_engine_network           = ""     # string | required | The relative resource name of the VMware Engine network. Spe…
  description                     = ""     # string | optional | User-provided description for this network policy.
  id                              = ""     # string | optional+computed
  project                         = ""     # string | optional+computed

  # create_time                     = ""     # string | computed | Creation time of this resource. A timestamp in RFC3339 UTC "…
  # uid                             = ""     # string | computed | System-generated unique identifier for the resource.
  # update_time                     = ""     # string | computed | Last updated time of this resource. A timestamp in RFC3339 U…
  # vmware_engine_network_canonical = ""     # string | computed | The canonical name of the VMware Engine network in the form:…

  external_ip { # list [0..1]
    enabled = false  # bool | optional | True if the service is enabled; false otherwise.

    # state   = ""     # string | computed | State of the service. New values may be added to this enum w…

  }

  internet_access { # list [0..1]
    enabled = false  # bool | optional | True if the service is enabled; false otherwise.

    # state   = ""     # string | computed | State of the service. New values may be added to this enum w…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

