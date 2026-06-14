# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_ha_vpn_gateway                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_ha_vpn_gateway" "this" {

  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  network            = ""     # string | required | The network this VPN gateway is accepting traffic for.
  description        = ""     # string | optional | An optional description of this resource.
  gateway_ip_version = ""     # string | optional | The IP family of the gateway IPs for the HA-VPN gateway inte…
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed
  region             = ""     # string | optional+computed | The region this gateway should sit in.
  stack_type         = ""     # string | optional | The stack type for this VPN gateway to identify the IP proto…

  # self_link          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

  vpn_interfaces { # list
    id                      = 0      # number | optional | The numeric ID of this VPN gateway interface.
    interconnect_attachment = ""     # string | optional | URL of the interconnect attachment resource. When the value …

    # ip_address              = ""     # string | computed | The external IP address for this VPN gateway interface.

  }

}

