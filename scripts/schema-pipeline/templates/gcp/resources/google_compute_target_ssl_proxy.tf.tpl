# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_target_ssl_proxy                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_target_ssl_proxy" "this" {

  backend_service    = ""     # string | required | A reference to the BackendService resource.
  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  certificate_map    = ""     # string | optional | A reference to the CertificateMap resource uri that identifi…
  description        = ""     # string | optional | An optional description of this resource.
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed
  proxy_header       = ""     # string | optional | Specifies the type of proxy header to append before sending …
  ssl_certificates   = []     # list(string) | optional | A list of SslCertificate resources that are used to authenti…
  ssl_policy         = ""     # string | optional | A reference to the SslPolicy resource that will be associate…

  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # proxy_id           = 0      # number | computed | The unique identifier for the resource.
  # self_link          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

