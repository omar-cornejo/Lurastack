# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_backend_bucket                           │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_backend_bucket" "this" {

  name                    = ""     # string | required | Name of the resource. Provided by the client when the resour…
  id                      = ""     # string | optional+computed
  project                 = ""     # string | optional

  # bucket_name             = ""     # string | computed | Cloud Storage bucket name.
  # cdn_policy = [  # list(object)
  #   {
  #     bypass_cache_on_request_headers = [  # list(object)
  #       {
  #         header_name = ""
  #       }
  #     ]
  #     cache_key_policy = [  # list(object)
  #       {
  #         include_http_headers = []  # list(string)
  #         query_string_whitelist = []  # list(string)
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
  #     request_coalescing = false
  #     serve_while_stale = 0
  #     signed_url_cache_max_age_sec = 0
  #   }
  # ]
  # compression_mode        = ""     # string | computed | Compress text responses using Brotli or gzip compression, ba…
  # creation_timestamp      = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # custom_response_headers = []     # list(string) | computed | Headers that the HTTP/S load balancer should add to proxied …
  # description             = ""     # string | computed | An optional textual description of the resource; provided by…
  # edge_security_policy    = ""     # string | computed | The security policy associated with this backend bucket.
  # enable_cdn              = false  # bool | computed | If true, enable Cloud CDN for this BackendBucket.
  # self_link               = ""     # string | computed

}

