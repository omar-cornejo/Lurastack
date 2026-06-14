# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_public_advertised_prefix             │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_public_advertised_prefix" "this" {

  dns_verification_ip = ""     # string | required | The IPv4 address to be used for reverse DNS verification.
  ip_cidr_range       = ""     # string | required | The IPv4 address range, in CIDR format, represented by this …
  name                = ""     # string | required | Name of the resource. The name must be 1-63 characters long,…
  description         = ""     # string | optional | An optional description of this resource.
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional+computed

  # self_link           = ""     # string | computed
  # shared_secret       = ""     # string | computed | Output Only. The shared secret to be used for reverse DNS ve…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

