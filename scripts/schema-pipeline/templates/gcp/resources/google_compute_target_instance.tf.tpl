# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_target_instance                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_target_instance" "this" {

  instance           = ""     # string | required | The Compute instance VM handling traffic for this target ins…
  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  description        = ""     # string | optional | An optional description of this resource.
  id                 = ""     # string | optional+computed
  nat_policy         = ""     # string | optional | NAT option controlling how IPs are NAT'ed to the instance. C…
  project            = ""     # string | optional+computed
  zone               = ""     # string | optional+computed | URL of the zone where the target instance resides.

  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # self_link          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

