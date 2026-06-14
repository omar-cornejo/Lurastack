# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_route                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_route" "this" {

  dest_range             = ""     # string | required | The destination range of outgoing packets that this route ap…
  name                   = ""     # string | required | Name of the resource. Provided by the client when the resour…
  network                = ""     # string | required | The network that this route applies to.
  description            = ""     # string | optional | An optional description of this resource. Provide this prope…
  id                     = ""     # string | optional+computed
  next_hop_gateway       = ""     # string | optional | URL to a gateway that should handle matching packets. Curren…
  next_hop_ilb           = ""     # string | optional | The IP address or URL to a forwarding rule of type loadBalan…
  next_hop_instance      = ""     # string | optional | URL to an instance that should handle matching packets. You …
  next_hop_instance_zone = ""     # string | optional+computed | The zone of the instance specified in next_hop_instance. Omi…
  next_hop_ip            = ""     # string | optional+computed | Network IP address of an instance that should handle matchin…
  next_hop_vpn_tunnel    = ""     # string | optional | URL to a VpnTunnel that should handle matching packets.
  priority               = 0      # number | optional | The priority of this route. Priority is used to break ties i…
  project                = ""     # string | optional+computed
  tags                   = []     # set(string) | optional | A list of instance tags to which this route applies.

  # next_hop_network       = ""     # string | computed | URL to a Network that should handle matching packets.
  # self_link              = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

