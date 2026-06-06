# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_stage                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_stage" "this" {

  api_id                = ""     # string | required
  name                  = ""     # string | required
  auto_deploy           = false  # bool | optional
  client_certificate_id = ""     # string | optional
  deployment_id         = ""     # string | optional+computed
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed
  stage_variables       = {}     # map(string) | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # execution_arn         = ""     # string | computed
  # invoke_url            = ""     # string | computed

  access_log_settings { # list [0..1]
    destination_arn = ""     # string | required
    format          = ""     # string | required

  }

  default_route_settings { # list [0..1]
    data_trace_enabled       = false  # bool | optional
    detailed_metrics_enabled = false  # bool | optional
    logging_level            = ""     # string | optional+computed
    throttling_burst_limit   = 0      # number | optional
    throttling_rate_limit    = 0      # number | optional

  }

  route_settings { # set
    route_key                = ""     # string | required
    data_trace_enabled       = false  # bool | optional
    detailed_metrics_enabled = false  # bool | optional
    logging_level            = ""     # string | optional+computed
    throttling_burst_limit   = 0      # number | optional
    throttling_rate_limit    = 0      # number | optional

  }

}

