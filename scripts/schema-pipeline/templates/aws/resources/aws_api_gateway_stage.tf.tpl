# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_stage                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_stage" "this" {

  deployment_id         = ""     # string | required
  rest_api_id           = ""     # string | required
  stage_name            = ""     # string | required
  cache_cluster_enabled = false  # bool | optional
  cache_cluster_size    = ""     # string | optional
  client_certificate_id = ""     # string | optional
  description           = ""     # string | optional
  documentation_version = ""     # string | optional
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed
  variables             = {}     # map(string) | optional
  xray_tracing_enabled  = false  # bool | optional

  # arn                   = ""     # string | computed
  # execution_arn         = ""     # string | computed
  # invoke_url            = ""     # string | computed
  # web_acl_arn           = ""     # string | computed

  access_log_settings { # list [0..1]
    destination_arn = ""     # string | required
    format          = ""     # string | required

  }

  canary_settings { # list [0..1]
    deployment_id            = ""     # string | required
    percent_traffic          = 0      # number | optional
    stage_variable_overrides = {}     # map(string) | optional
    use_stage_cache          = false  # bool | optional

  }

}

