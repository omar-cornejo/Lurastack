# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_ha_vpn_gateway                           │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_ha_vpn_gateway" "this" {

  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional
  region             = ""     # string | optional | The region this gateway should sit in.

  # description        = ""     # string | computed | An optional description of this resource.
  # gateway_ip_version = ""     # string | computed | The IP family of the gateway IPs for the HA-VPN gateway inte…
  # network            = ""     # string | computed | The network this VPN gateway is accepting traffic for.
  # self_link          = ""     # string | computed
  # stack_type         = ""     # string | computed | The stack type for this VPN gateway to identify the IP proto…
  # vpn_interfaces = [  # list(object)
  #   {
  #     id = 0
  #     interconnect_attachment = ""
  #     ip_address = ""
  #   }
  # ]

}

