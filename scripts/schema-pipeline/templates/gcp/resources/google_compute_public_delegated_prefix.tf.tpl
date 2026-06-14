# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_public_delegated_prefix              │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_public_delegated_prefix" "this" {

  ip_cidr_range     = ""     # string | required | The IPv4 address range, in CIDR format, represented by this …
  name              = ""     # string | required | Name of the resource. The name must be 1-63 characters long,…
  parent_prefix     = ""     # string | required | The URL of parent prefix. Either PublicAdvertisedPrefix or P…
  region            = ""     # string | required | A region where the prefix will reside.
  description       = ""     # string | optional | An optional description of this resource.
  id                = ""     # string | optional+computed
  is_live_migration = false  # bool | optional | If true, the prefix will be live migrated.
  project           = ""     # string | optional+computed

  # self_link         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

