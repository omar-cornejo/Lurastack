# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_services_edge_cache_origin           │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_services_edge_cache_origin" "this" {

  name             = ""     # string | required | Name of the resource; provided by the client when the resour…
  origin_address   = ""     # string | required | A fully qualified domain name (FQDN) or IP address reachable…
  description      = ""     # string | optional | A human-readable description of the resource.
  failover_origin  = ""     # string | optional | The Origin resource to try when the current origin cannot be…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Set of label tags associated with the EdgeCache resource.  *…
  max_attempts     = 0      # number | optional | The maximum number of attempts to cache fill from this origi…
  port             = 0      # number | optional+computed | The port to connect to the origin on. Defaults to port 443 f…
  project          = ""     # string | optional+computed
  protocol         = ""     # string | optional+computed | The protocol to use to connect to the configured origin. Def…
  retry_conditions = []     # list(string) | optional+computed | Specifies one or more retry conditions for the configured or…

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  aws_v4_authentication { # list [0..1]
    access_key_id             = ""     # string | required | The access key ID your origin uses to identify the key.
    origin_region             = ""     # string | required | The name of the AWS region that your origin is in.
    secret_access_key_version = ""     # string | required | The Secret Manager secret version of the secret access key u…

  }

  origin_override_action { # list [0..1]

    header_action { # list [0..1]

      request_headers_to_add { # list [0..25]
        header_name  = ""     # string | required | The name of the header to add.
        header_value = ""     # string | required | The value of the header to add.
        replace      = false  # bool | optional | Whether to replace all existing headers with the same name. …

      }

    }

    url_rewrite { # list [0..1]
      host_rewrite = ""     # string | optional | Prior to forwarding the request to the selected origin, the …

    }

  }

  origin_redirect { # list [0..1]
    redirect_conditions = []     # list(string) | optional | The set of redirect response codes that the CDN follows. Val…

  }

  timeout { # list [0..1]
    connect_timeout      = ""     # string | optional | The maximum duration to wait for a single origin connection …
    max_attempts_timeout = ""     # string | optional | The maximum time across all connection attempts to the origi…
    read_timeout         = ""     # string | optional | The maximum duration to wait between reads of a single HTTP …
    response_timeout     = ""     # string | optional | The maximum duration to wait for the last byte of a response…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

