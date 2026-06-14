# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_target_https_proxy            │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_target_https_proxy" "this" {

  name                             = ""     # string | required | Name of the resource. Provided by the client when the resour…
  url_map                          = ""     # string | required | A reference to the RegionUrlMap resource that defines the ma…
  certificate_manager_certificates = []     # list(string) | optional | URLs to certificate manager certificate resources that are u…
  description                      = ""     # string | optional | An optional description of this resource.
  id                               = ""     # string | optional+computed
  project                          = ""     # string | optional+computed
  region                           = ""     # string | optional+computed | The Region in which the created target https proxy should re…
  server_tls_policy                = ""     # string | optional | A URL referring to a networksecurity.ServerTlsPolicy resourc…
  ssl_certificates                 = []     # list(string) | optional | URLs to SslCertificate resources that are used to authentica…
  ssl_policy                       = ""     # string | optional | A reference to the Region SslPolicy resource that will be as…

  # creation_timestamp               = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # proxy_id                         = 0      # number | computed | The unique identifier for the resource.
  # self_link                        = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

