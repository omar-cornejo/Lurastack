# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_router                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_router" "this" {

  name                          = ""     # string | required | Name of the resource. The name must be 1-63 characters long,…
  network                       = ""     # string | required | A reference to the network to which this router belongs.
  description                   = ""     # string | optional | An optional description of this resource.
  encrypted_interconnect_router = false  # bool | optional | Indicates if a router is dedicated for use with encrypted VL…
  id                            = ""     # string | optional+computed
  project                       = ""     # string | optional+computed
  region                        = ""     # string | optional+computed | Region where the router resides.

  # creation_timestamp            = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # self_link                     = ""     # string | computed

  bgp { # list [0..1]
    asn                = 0      # number | required | Local BGP Autonomous System Number (ASN). Must be an RFC6996…
    advertise_mode     = ""     # string | optional | User-specified flag to indicate which mode to use for advert…
    advertised_groups  = []     # list(string) | optional | User-specified list of prefix groups to advertise in custom …
    identifier_range   = ""     # string | optional+computed | Explicitly specifies a range of valid BGP Identifiers for th…
    keepalive_interval = 0      # number | optional | The interval in seconds between BGP keepalive messages that …

    advertised_ip_ranges { # list
      range       = ""     # string | required | The IP range to advertise. The value must be a CIDR-formatte…
      description = ""     # string | optional | User-specified description for the IP range.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

