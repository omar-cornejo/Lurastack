# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_edgecontainer_vpn_connection                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_edgecontainer_vpn_connection" "this" {

  cluster                  = ""     # string | required | The canonical Cluster name to connect to. It is in the form …
  location                 = ""     # string | required | Google Cloud Platform location.
  name                     = ""     # string | required | The resource name of VPN connection
  enable_high_availability = false  # bool | optional+computed | Whether this VPN connection has HA enabled on cluster side. …
  id                       = ""     # string | optional+computed
  labels                   = {}     # map(string) | optional | Labels associated with this resource.  **Note**: This field …
  nat_gateway_ip           = ""     # string | optional | NAT gateway IP, or WAN IP address. If a customer has multipl…
  project                  = ""     # string | optional+computed
  router                   = ""     # string | optional | The VPN connection Cloud Router name.
  vpc                      = ""     # string | optional | The network ID of VPC to connect to.

  # create_time              = ""     # string | computed | The time when the VPN connection was created.
  # details = [  # list(object)
  #   {
  #     cloud_router = [  # list(object)
  #       {
  #         name = ""
  #       }
  #     ]
  #     cloud_vpns = [  # list(object)
  #       {
  #         gateway = ""
  #       }
  #     ]
  #     error = ""
  #     state = ""
  #   }
  # ]
  # effective_labels         = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels         = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time              = ""     # string | computed | The time when the VPN connection was last updated.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_project { # list [0..1]
    project_id = ""     # string | optional | The project of the VPC to connect to. If not specified, it i…

  }

}

