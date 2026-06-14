# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_tunnel_dest_group                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_tunnel_dest_group" "this" {

  group_name = ""     # string | required | Unique tunnel destination group name.
  cidrs      = []     # list(string) | optional | List of CIDRs that this group applies to.
  fqdns      = []     # list(string) | optional | List of FQDNs that this group applies to.
  id         = ""     # string | optional+computed
  project    = ""     # string | optional+computed
  region     = ""     # string | optional+computed | The region of the tunnel group. Must be the same as the netw…

  # name       = ""     # string | computed | Full resource name.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

