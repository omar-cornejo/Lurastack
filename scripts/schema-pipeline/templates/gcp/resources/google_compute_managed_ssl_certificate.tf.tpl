# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_managed_ssl_certificate              │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_managed_ssl_certificate" "this" {

  certificate_id            = 0      # number | optional+computed | The unique identifier for the resource.
  description               = ""     # string | optional | An optional description of this resource.
  id                        = ""     # string | optional+computed
  name                      = ""     # string | optional | Name of the resource. Provided by the client when the resour…
  project                   = ""     # string | optional+computed
  type                      = ""     # string | optional | Enum field whose value is always 'MANAGED' - used to signal …

  # creation_timestamp        = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # expire_time               = ""     # string | computed | Expire time of the certificate in RFC3339 text format.
  # self_link                 = ""     # string | computed
  # subject_alternative_names = []     # list(string) | computed | Domains associated with the certificate via Subject Alternat…

  managed { # list [0..1]
    domains = []     # list(string) | required | Domains for which a managed SSL certificate will be valid.  …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

