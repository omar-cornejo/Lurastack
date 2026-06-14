# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_connectivity_spoke                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_connectivity_spoke" "this" {

  hub              = ""     # string | required | Immutable. The URI of the hub that this spoke is attached to…
  location         = ""     # string | required | The location for the resource
  name             = ""     # string | required | Immutable. The name of the spoke. Spoke names must be unique…
  description      = ""     # string | optional | An optional description of the spoke.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Optional labels in key:value format. For more information ab…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Output only. The time the spoke was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # state            = ""     # string | computed | Output only. The current lifecycle state of this spoke.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # unique_id        = ""     # string | computed | Output only. The Google-generated UUID for the spoke. This v…
  # update_time      = ""     # string | computed | Output only. The time the spoke was last updated.

  linked_interconnect_attachments { # list [0..1]
    site_to_site_data_transfer = false  # bool | required | A value that controls whether site-to-site data transfer is …
    uris                       = []     # list(string) | required | The URIs of linked interconnect attachment resources

  }

  linked_router_appliance_instances { # list [0..1]
    site_to_site_data_transfer = false  # bool | required | A value that controls whether site-to-site data transfer is …

    instances { # list [1..*]
      ip_address      = ""     # string | optional | The IP address on the VM to use for peering.
      virtual_machine = ""     # string | optional | The URI of the virtual machine resource

    }

  }

  linked_vpc_network { # list [0..1]
    uri                   = ""     # string | required | The URI of the VPC network resource.
    exclude_export_ranges = []     # list(string) | optional | IP ranges encompassing the subnets to be excluded from peeri…

  }

  linked_vpn_tunnels { # list [0..1]
    site_to_site_data_transfer = false  # bool | required | A value that controls whether site-to-site data transfer is …
    uris                       = []     # list(string) | required | The URIs of linked VPN tunnel resources.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

