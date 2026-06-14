# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_monitoring_uptime_check_config               │
# └──────────────────────────────────────────────────────────────┘
resource "google_monitoring_uptime_check_config" "this" {

  display_name     = ""     # string | required | A human-friendly name for the uptime check configuration. Th…
  timeout          = ""     # string | required | The maximum amount of time to wait for the request to comple…
  checker_type     = ""     # string | optional+computed | The checker type to use for the check. If the monitored reso…
  id               = ""     # string | optional+computed
  period           = ""     # string | optional | How often, in seconds, the uptime check is performed. Curren…
  project          = ""     # string | optional+computed
  selected_regions = []     # list(string) | optional | The list of regions from which the check will be run. Some r…
  user_labels      = {}     # map(string) | optional | User-supplied key/value data to be used for organizing and i…

  # name             = ""     # string | computed | A unique resource name for this UptimeCheckConfig. The forma…
  # uptime_check_id  = ""     # string | computed | The id of the uptime check

  content_matchers { # list
    content = ""     # string | required | String or regex content to match (max 1024 bytes)
    matcher = ""     # string | optional | The type of content matcher that will be applied to the serv…

    json_path_matcher { # list [0..1]
      json_path    = ""     # string | required | JSONPath within the response output pointing to the expected…
      json_matcher = ""     # string | optional | Options to perform JSONPath content matching. Default value:…

    }

  }

  http_check { # list [0..1]
    body                = ""     # string | optional | The request body associated with the HTTP POST request. If '…
    content_type        = ""     # string | optional | The content type to use for the check. Possible values: ["TY…
    custom_content_type = ""     # string | optional | A user provided content type header to use for the check. Th…
    headers             = {}     # map(string) | optional+computed | The list of headers to send as part of the uptime check requ…
    mask_headers        = false  # bool | optional | Boolean specifying whether to encrypt the header information…
    path                = ""     # string | optional | The path to the page to run the check against. Will be combi…
    port                = 0      # number | optional+computed | The port to the page to run the check against. Will be combi…
    request_method      = ""     # string | optional | The HTTP request method to use for the check. If set to 'MET…
    use_ssl             = false  # bool | optional | If true, use HTTPS instead of HTTP to run the check.
    validate_ssl        = false  # bool | optional | Boolean specifying whether to include SSL certificate valida…

    accepted_response_status_codes { # list
      status_class = ""     # string | optional | A class of status codes to accept. Possible values: ["STATUS…
      status_value = 0      # number | optional | A status code to accept.

    }

    auth_info { # list [0..1]
      password = ""     # string | required+sensitive | The password to authenticate.
      username = ""     # string | required | The username to authenticate.

    }

    ping_config { # list [0..1]
      pings_count = 0      # number | required | Number of ICMP pings. A maximum of 3 ICMP pings is currently…

    }

    service_agent_authentication { # list [0..1]
      type = ""     # string | optional | The type of authentication to use. Possible values: ["SERVIC…

    }

  }

  monitored_resource { # list [0..1]
    labels = {}     # map(string) | required | Values for all of the labels listed in the associated monito…
    type   = ""     # string | required | The monitored resource type. This field must match the type …

  }

  resource_group { # list [0..1]
    group_id      = ""     # string | optional | The group of resources being monitored. Should be the 'name'…
    resource_type = ""     # string | optional | The resource type of the group members. Possible values: ["R…

  }

  synthetic_monitor { # list [0..1]

    cloud_function_v2 { # list [1..1]
      name = ""     # string | required | The fully qualified name of the cloud function resource.

    }

  }

  tcp_check { # list [0..1]
    port = 0      # number | required | The port to the page to run the check against. Will be combi…

    ping_config { # list [0..1]
      pings_count = 0      # number | required | Number of ICMP pings. A maximum of 3 ICMP pings is currently…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

