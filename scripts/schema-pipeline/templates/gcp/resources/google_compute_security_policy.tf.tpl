# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_security_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_security_policy" "this" {

  name        = ""     # string | required | The name of the security policy.
  description = ""     # string | optional | An optional description of this security policy. Max size is…
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed | The project in which the resource belongs. If it is not prov…
  type        = ""     # string | optional+computed | The type indicates the intended use of the security policy. …

  # fingerprint = ""     # string | computed | Fingerprint of this resource.
  # self_link   = ""     # string | computed | The URI of the created resource.

  adaptive_protection_config { # list [0..1]

    layer_7_ddos_defense_config { # list [0..1]
      enable          = false  # bool | optional | If set to true, enables CAAP for L7 DDoS detection.
      rule_visibility = ""     # string | optional+computed | Rule visibility. Supported values include: "STANDARD", "PREM…

    }

  }

  advanced_options_config { # list [0..1]
    json_parsing            = ""     # string | optional+computed | JSON body parsing. Supported values include: "DISABLED", "ST…
    log_level               = ""     # string | optional+computed | Logging level. Supported values include: "NORMAL", "VERBOSE"…
    user_ip_request_headers = []     # set(string) | optional | An optional list of case-insensitive request header names to…

    json_custom_config { # list [0..1]
      content_types = []     # set(string) | required | A list of custom Content-Type header values to apply the JSO…

    }

  }

  recaptcha_options_config { # list [0..1]
    redirect_site_key = ""     # string | required | A field to supply a reCAPTCHA site key to be used for all th…

  }

  rule { # set
    action      = ""     # string | required | Action to take when match matches the request.
    priority    = 0      # number | required | An unique positive integer indicating the priority of evalua…
    description = ""     # string | optional | An optional description of this rule. Max size is 64.
    preview     = false  # bool | optional+computed | When set to true, the action specified above is not enforced…

    header_action { # list [0..1]

      request_headers_to_adds { # list [1..*]
        header_name  = ""     # string | required | The name of the header to set.
        header_value = ""     # string | optional | The value to set the named header to.

      }

    }

    match { # list [1..1]
      versioned_expr = ""     # string | optional | Predefined rule expression. If this field is specified, conf…

      config { # list [0..1]
        src_ip_ranges = []     # set(string) | required | Set of IP addresses or ranges (IPV4 or IPV6) in CIDR notatio…

      }

      expr { # list [0..1]
        expression = ""     # string | required | Textual representation of an expression in Common Expression…

      }

      expr_options { # list [0..1]

        recaptcha_options { # list [1..1]
          action_token_site_keys  = []     # list(string) | optional | A list of site keys to be used during the validation of reCA…
          session_token_site_keys = []     # list(string) | optional | A list of site keys to be used during the validation of reCA…

        }

      }

    }

    rate_limit_options { # list [0..1]
      conform_action      = ""     # string | required | Action to take for requests that are under the configured ra…
      exceed_action       = ""     # string | required | Action to take for requests that are above the configured ra…
      ban_duration_sec    = 0      # number | optional | Can only be specified if the action for the rule is "rate_ba…
      enforce_on_key      = ""     # string | optional | Determines the key to enforce the rateLimitThreshold on
      enforce_on_key_name = ""     # string | optional | Rate limit key name applicable only for the following key ty…

      ban_threshold { # list [0..1]
        count        = 0      # number | required | Number of HTTP(S) requests for calculating the threshold.
        interval_sec = 0      # number | required | Interval over which the threshold is computed.

      }

      exceed_redirect_options { # list [0..1]
        type   = ""     # string | required | Type of the redirect action.
        target = ""     # string | optional | Target for the redirect action. This is required if the type…

      }

      rate_limit_threshold { # list [1..1]
        count        = 0      # number | required | Number of HTTP(S) requests for calculating the threshold.
        interval_sec = 0      # number | required | Interval over which the threshold is computed.

      }

    }

    redirect_options { # list [0..1]
      type   = ""     # string | required | Type of the redirect action. Available options: EXTERNAL_302…
      target = ""     # string | optional | Target for the redirect action. This is required if the type…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

