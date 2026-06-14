# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_ssl_certificate                          │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_ssl_certificate" "this" {

  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional

  # certificate        = ""     # string | computed | The certificate in PEM format. The certificate chain must be…
  # certificate_id     = 0      # number | computed | The unique identifier for the resource.
  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description        = ""     # string | computed | An optional description of this resource.
  # expire_time        = ""     # string | computed | Expire time of the certificate in RFC3339 text format.
  # name_prefix        = ""     # string | computed | Creates a unique name beginning with the specified prefix. C…
  # private_key        = ""     # string | computed | The write-only private key in PEM format.
  # self_link          = ""     # string | computed

}

