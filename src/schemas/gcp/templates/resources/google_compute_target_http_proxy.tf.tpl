# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_target_http_proxy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_target_http_proxy" "this" {

  name                        = ""     # string | required | Name of the resource. Provided by the client when the resour…
  url_map                     = ""     # string | required | A reference to the UrlMap resource that defines the mapping …
  description                 = ""     # string | optional | An optional description of this resource.
  http_keep_alive_timeout_sec = 0      # number | optional | Specifies how long to keep a connection open, after completi…
  id                          = ""     # string | optional+computed
  project                     = ""     # string | optional+computed
  proxy_bind                  = false  # bool | optional+computed | This field only applies when the forwarding rule that refere…

  # creation_timestamp          = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # proxy_id                    = 0      # number | computed | The unique identifier for the resource.
  # self_link                   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

