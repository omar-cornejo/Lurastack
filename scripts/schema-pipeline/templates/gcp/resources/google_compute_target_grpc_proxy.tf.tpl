# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_target_grpc_proxy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_target_grpc_proxy" "this" {

  name                   = ""     # string | required | Name of the resource. Provided by the client when the resour…
  description            = ""     # string | optional | An optional description of this resource.
  id                     = ""     # string | optional+computed
  project                = ""     # string | optional+computed
  url_map                = ""     # string | optional | URL to the UrlMap resource that defines the mapping from URL…
  validate_for_proxyless = false  # bool | optional | If true, indicates that the BackendServices referenced by th…

  # creation_timestamp     = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # fingerprint            = ""     # string | computed | Fingerprint of this resource. A hash of the contents stored …
  # self_link              = ""     # string | computed
  # self_link_with_id      = ""     # string | computed | Server-defined URL with id for the resource.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

