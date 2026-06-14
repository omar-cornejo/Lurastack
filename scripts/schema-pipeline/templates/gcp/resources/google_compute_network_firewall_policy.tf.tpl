# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_network_firewall_policy              │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_network_firewall_policy" "this" {

  name                       = ""     # string | required | User-provided name of the Network firewall policy. The name …
  description                = ""     # string | optional | An optional description of this resource. Provide this prope…
  id                         = ""     # string | optional+computed
  project                    = ""     # string | optional+computed

  # creation_timestamp         = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # fingerprint                = ""     # string | computed | Fingerprint of the resource. This field is used internally d…
  # network_firewall_policy_id = ""     # string | computed | The unique identifier for the resource. This identifier is d…
  # rule_tuple_count           = 0      # number | computed | Total count of all firewall policy rule tuples. A firewall p…
  # self_link                  = ""     # string | computed | Server-defined URL for the resource.
  # self_link_with_id          = ""     # string | computed | Server-defined URL for this resource with the resource id.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

