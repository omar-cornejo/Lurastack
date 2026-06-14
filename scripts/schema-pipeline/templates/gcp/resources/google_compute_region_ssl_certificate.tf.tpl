# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_ssl_certificate               │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_ssl_certificate" "this" {

  certificate        = ""     # string | required+sensitive | The certificate in PEM format. The certificate chain must be…
  private_key        = ""     # string | required+sensitive | The write-only private key in PEM format.
  description        = ""     # string | optional | An optional description of this resource.
  id                 = ""     # string | optional+computed
  name               = ""     # string | optional+computed | Name of the resource. Provided by the client when the resour…
  name_prefix        = ""     # string | optional+computed | Creates a unique name beginning with the specified prefix. C…
  project            = ""     # string | optional+computed
  region             = ""     # string | optional+computed | The Region in which the created regional ssl certificate sho…

  # certificate_id     = 0      # number | computed | The unique identifier for the resource.
  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # expire_time        = ""     # string | computed | Expire time of the certificate in RFC3339 text format.
  # self_link          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

