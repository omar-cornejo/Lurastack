# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_method_settings                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_method_settings" "this" {

  method_path = ""     # string | required
  rest_api_id = ""     # string | required
  stage_name  = ""     # string | required
  id          = ""     # string | optional+computed

  settings { # list [1..1]
    cache_data_encrypted                       = false  # bool | optional+computed
    cache_ttl_in_seconds                       = 0      # number | optional+computed
    caching_enabled                            = false  # bool | optional+computed
    data_trace_enabled                         = false  # bool | optional+computed
    logging_level                              = ""     # string | optional+computed
    metrics_enabled                            = false  # bool | optional+computed
    require_authorization_for_cache_control    = false  # bool | optional+computed
    throttling_burst_limit                     = 0      # number | optional
    throttling_rate_limit                      = 0      # number | optional
    unauthorized_cache_control_header_strategy = ""     # string | optional+computed

  }

}

