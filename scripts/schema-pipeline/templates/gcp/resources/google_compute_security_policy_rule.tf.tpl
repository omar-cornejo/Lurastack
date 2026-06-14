# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_security_policy_rule                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_security_policy_rule" "this" {

  action          = ""     # string | required | The Action to perform when the rule is matched. The followin…
  priority        = 0      # number | required | An integer indicating the priority of a rule in the list. Th…
  security_policy = ""     # string | required | The name of the security policy this rule belongs to.
  description     = ""     # string | optional | An optional description of this resource. Provide this prope…
  id              = ""     # string | optional+computed
  preview         = false  # bool | optional | If set to true, the specified action is not enforced.
  project         = ""     # string | optional+computed

  match { # list [0..1]
    versioned_expr = ""     # string | optional | Preconfigured versioned expression. If this field is specifi…

    config { # list [0..1]
      src_ip_ranges = []     # list(string) | optional | CIDR IP address range. Maximum number of srcIpRanges allowed…

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

  preconfigured_waf_config { # list [0..1]

    exclusion { # list
      target_rule_set = ""     # string | required | Target WAF rule set to apply the preconfigured WAF exclusion…
      target_rule_ids = []     # list(string) | optional | A list of target rule IDs under the WAF rule set to apply th…

      request_cookie { # list
        operator = ""     # string | required | You can specify an exact match or a partial match by using a…
        value    = ""     # string | optional | A request field matching the specified value will be exclude…

      }

      request_header { # list
        operator = ""     # string | required | You can specify an exact match or a partial match by using a…
        value    = ""     # string | optional | A request field matching the specified value will be exclude…

      }

      request_query_param { # list
        operator = ""     # string | required | You can specify an exact match or a partial match by using a…
        value    = ""     # string | optional | A request field matching the specified value will be exclude…

      }

      request_uri { # list
        operator = ""     # string | required | You can specify an exact match or a partial match by using a…
        value    = ""     # string | optional | A request field matching the specified value will be exclude…

      }

    }

  }

  rate_limit_options { # list [0..1]
    ban_duration_sec    = 0      # number | optional | Can only be specified if the action for the rule is "rate_ba…
    conform_action      = ""     # string | optional | Action to take for requests that are under the configured ra…
    enforce_on_key      = ""     # string | optional | Determines the key to enforce the rateLimitThreshold on. Pos…
    enforce_on_key_name = ""     # string | optional | Rate limit key name applicable only for the following key ty…
    exceed_action       = ""     # string | optional | Action to take for requests that are above the configured ra…

    ban_threshold { # list [0..1]
      count        = 0      # number | optional | Number of HTTP(S) requests for calculating the threshold.
      interval_sec = 0      # number | optional | Interval over which the threshold is computed.

    }

    enforce_on_key_configs { # list
      enforce_on_key_name = ""     # string | optional | Rate limit key name applicable only for the following key ty…
      enforce_on_key_type = ""     # string | optional | Determines the key to enforce the rateLimitThreshold on. Pos…

    }

    exceed_redirect_options { # list [0..1]
      target = ""     # string | optional | Target for the redirect action. This is required if the type…
      type   = ""     # string | optional | Type of the redirect action.

    }

    rate_limit_threshold { # list [0..1]
      count        = 0      # number | optional | Number of HTTP(S) requests for calculating the threshold.
      interval_sec = 0      # number | optional | Interval over which the threshold is computed.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

