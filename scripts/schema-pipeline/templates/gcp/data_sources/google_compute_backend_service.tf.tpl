# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_backend_service                          │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_backend_service" "this" {

  name                            = ""     # string | required | Name of the resource. Provided by the client when the resour…
  id                              = ""     # string | optional+computed
  project                         = ""     # string | optional

  # affinity_cookie_ttl_sec         = 0      # number | computed | Lifetime of cookies in seconds if session_affinity is GENERA…
  # backend = [  # set(object)
  #   {
  #     balancing_mode = ""
  #     capacity_scaler = 0
  #     description = ""
  #     group = ""
  #     max_connections = 0
  #     max_connections_per_endpoint = 0
  #     max_connections_per_instance = 0
  #     max_rate = 0
  #     max_rate_per_endpoint = 0
  #     max_rate_per_instance = 0
  #     max_utilization = 0
  #   }
  # ]
  # cdn_policy = [  # list(object)
  #   {
  #     bypass_cache_on_request_headers = [  # list(object)
  #       {
  #         header_name = ""
  #       }
  #     ]
  #     cache_key_policy = [  # list(object)
  #       {
  #         include_host = false
  #         include_http_headers = []  # list(string)
  #         include_named_cookies = []  # list(string)
  #         include_protocol = false
  #         include_query_string = false
  #         query_string_blacklist = []  # set(string)
  #         query_string_whitelist = []  # set(string)
  #       }
  #     ]
  #     cache_mode = ""
  #     client_ttl = 0
  #     default_ttl = 0
  #     max_ttl = 0
  #     negative_caching = false
  #     negative_caching_policy = [  # list(object)
  #       {
  #         code = 0
  #         ttl = 0
  #       }
  #     ]
  #     serve_while_stale = 0
  #     signed_url_cache_max_age_sec = 0
  #   }
  # ]
  # circuit_breakers = [  # list(object)
  #   {
  #     max_connections = 0
  #     max_pending_requests = 0
  #     max_requests = 0
  #     max_requests_per_connection = 0
  #     max_retries = 0
  #   }
  # ]
  # compression_mode                = ""     # string | computed | Compress text responses using Brotli or gzip compression, ba…
  # connection_draining_timeout_sec = 0      # number | computed | Time for which instance will be drained (not accept new conn…
  # consistent_hash = [  # list(object)
  #   {
  #     http_cookie = [  # list(object)
  #       {
  #         name = ""
  #         path = ""
  #         ttl = [  # list(object)
  #           {
  #             nanos = 0
  #             seconds = 0
  #           }
  #         ]
  #       }
  #     ]
  #     http_header_name = ""
  #     minimum_ring_size = 0
  #   }
  # ]
  # creation_timestamp              = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # custom_request_headers          = []     # set(string) | computed | Headers that the HTTP/S load balancer should add to proxied …
  # custom_response_headers         = []     # set(string) | computed | Headers that the HTTP/S load balancer should add to proxied …
  # description                     = ""     # string | computed | An optional description of this resource.
  # edge_security_policy            = ""     # string | computed | The resource URL for the edge security policy associated wit…
  # enable_cdn                      = false  # bool | computed | If true, enable Cloud CDN for this BackendService.
  # fingerprint                     = ""     # string | computed | Fingerprint of this resource. A hash of the contents stored …
  # generated_id                    = 0      # number | computed | The unique identifier for the resource. This identifier is d…
  # health_checks                   = []     # set(string) | computed | The set of URLs to the HttpHealthCheck or HttpsHealthCheck r…
  # iap = [  # list(object)
  #   {
  #     oauth2_client_id = ""
  #     oauth2_client_secret = ""
  #     oauth2_client_secret_sha256 = ""
  #   }
  # ]
  # load_balancing_scheme           = ""     # string | computed | Indicates whether the backend service will be used with inte…
  # locality_lb_policies = [  # list(object)
  #   {
  #     custom_policy = [  # list(object)
  #       {
  #         data = ""
  #         name = ""
  #       }
  #     ]
  #     policy = [  # list(object)
  #       {
  #         name = ""
  #       }
  #     ]
  #   }
  # ]
  # locality_lb_policy              = ""     # string | computed | The load balancing algorithm used within the scope of the lo…
  # log_config = [  # list(object)
  #   {
  #     enable = false
  #     sample_rate = 0
  #   }
  # ]
  # outlier_detection = [  # list(object)
  #   {
  #     base_ejection_time = [  # list(object)
  #       {
  #         nanos = 0
  #         seconds = 0
  #       }
  #     ]
  #     consecutive_errors = 0
  #     consecutive_gateway_failure = 0
  #     enforcing_consecutive_errors = 0
  #     enforcing_consecutive_gateway_failure = 0
  #     enforcing_success_rate = 0
  #     interval = [  # list(object)
  #       {
  #         nanos = 0
  #         seconds = 0
  #       }
  #     ]
  #     max_ejection_percent = 0
  #     success_rate_minimum_hosts = 0
  #     success_rate_request_volume = 0
  #     success_rate_stdev_factor = 0
  #   }
  # ]
  # port_name                       = ""     # string | computed | Name of backend port. The same name should appear in the ins…
  # protocol                        = ""     # string | computed | The protocol this BackendService uses to communicate with ba…
  # security_policy                 = ""     # string | computed | The security policy associated with this backend service.
  # security_settings = [  # list(object)
  #   {
  #     aws_v4_authentication = [  # list(object)
  #       {
  #         access_key = ""
  #         access_key_id = ""
  #         access_key_version = ""
  #         origin_region = ""
  #       }
  #     ]
  #     client_tls_policy = ""
  #     subject_alt_names = []  # list(string)
  #   }
  # ]
  # self_link                       = ""     # string | computed
  # service_lb_policy               = ""     # string | computed | URL to networkservices.ServiceLbPolicy resource. Can only be…
  # session_affinity                = ""     # string | computed | Type of session affinity to use. The default is NONE. Sessio…
  # timeout_sec                     = 0      # number | computed | The backend service timeout has a different meaning dependin…

}

