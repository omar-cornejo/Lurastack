# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_environment                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_environment" "this" {

  name              = ""     # string | required | The resource ID of the environment.
  org_id            = ""     # string | required | The Apigee Organization associated with the Apigee environme…
  api_proxy_type    = ""     # string | optional+computed | Optional. API Proxy type supported by the environment. The t…
  deployment_type   = ""     # string | optional+computed | Optional. Deployment type supported by the environment. The …
  description       = ""     # string | optional | Description of the environment.
  display_name      = ""     # string | optional | Display name of the environment.
  forward_proxy_uri = ""     # string | optional | Optional. URI of the forward proxy to be applied to the runt…
  id                = ""     # string | optional+computed
  type              = ""     # string | optional+computed | Types that can be selected for an Environment. Each of the t…

  node_config { # list [0..1]
    max_node_count               = ""     # string | optional | The maximum total number of gateway nodes that the is reserv…
    min_node_count               = ""     # string | optional | The minimum total number of gateway nodes that the is reserv…

    # current_aggregate_node_count = ""     # string | computed | The current total number of gateway nodes that each environm…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

