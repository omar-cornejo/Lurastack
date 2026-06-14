# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_firewall_policy_association          │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_firewall_policy_association" "this" {

  attachment_target = ""     # string | required | The target that the firewall policy is attached to.
  firewall_policy   = ""     # string | required | The firewall policy ID of the association.
  name              = ""     # string | required | The name for an association.
  id                = ""     # string | optional+computed

  # short_name        = ""     # string | computed | The short name of the firewall policy of the association.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

