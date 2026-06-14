# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_target_http_proxy             │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_target_http_proxy" "this" {

  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  url_map            = ""     # string | required | A reference to the RegionUrlMap resource that defines the ma…
  description        = ""     # string | optional | An optional description of this resource.
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed
  region             = ""     # string | optional+computed | The Region in which the created target https proxy should re…

  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # proxy_id           = 0      # number | computed | The unique identifier for the resource.
  # self_link          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

