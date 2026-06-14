# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_health_check                             │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_health_check" "this" {

  name                = ""     # string | required | Name of the resource. Provided by the client when the resour…
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional

  # check_interval_sec  = 0      # number | computed | How often (in seconds) to send a health check. The default v…
  # creation_timestamp  = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description         = ""     # string | computed | An optional description of this resource. Provide this prope…
  # grpc_health_check = [  # list(object)
  #   {
  #     grpc_service_name = ""
  #     port = 0
  #     port_name = ""
  #     port_specification = ""
  #   }
  # ]
  # healthy_threshold   = 0      # number | computed | A so-far unhealthy instance will be marked healthy after thi…
  # http2_health_check = [  # list(object)
  #   {
  #     host = ""
  #     port = 0
  #     port_name = ""
  #     port_specification = ""
  #     proxy_header = ""
  #     request_path = ""
  #     response = ""
  #   }
  # ]
  # http_health_check = [  # list(object)
  #   {
  #     host = ""
  #     port = 0
  #     port_name = ""
  #     port_specification = ""
  #     proxy_header = ""
  #     request_path = ""
  #     response = ""
  #   }
  # ]
  # https_health_check = [  # list(object)
  #   {
  #     host = ""
  #     port = 0
  #     port_name = ""
  #     port_specification = ""
  #     proxy_header = ""
  #     request_path = ""
  #     response = ""
  #   }
  # ]
  # log_config = [  # list(object)
  #   {
  #     enable = false
  #   }
  # ]
  # self_link           = ""     # string | computed
  # source_regions      = []     # list(string) | computed | The list of cloud regions from which health checks are perfo…
  # ssl_health_check = [  # list(object)
  #   {
  #     port = 0
  #     port_name = ""
  #     port_specification = ""
  #     proxy_header = ""
  #     request = ""
  #     response = ""
  #   }
  # ]
  # tcp_health_check = [  # list(object)
  #   {
  #     port = 0
  #     port_name = ""
  #     port_specification = ""
  #     proxy_header = ""
  #     request = ""
  #     response = ""
  #   }
  # ]
  # timeout_sec         = 0      # number | computed | How long (in seconds) to wait before claiming failure. The d…
  # type                = ""     # string | computed | The type of the health check. One of HTTP, HTTPS, TCP, or SS…
  # unhealthy_threshold = 0      # number | computed | A so-far healthy instance will be marked unhealthy after thi…

}

